#!/usr/bin/env python3
import sys
import os

from pycparser import parse_file, c_ast

LIBNAME = sys.argv[1]

def getfield(x):
    is_ptr = False
    if isinstance(x.type, c_ast.PtrDecl):
        is_ptr = True
        x.type = x.type.type

    declname = x.type.declname if not isinstance(x.type, c_ast.ArrayDecl) else x.type.type.declname
    assert x.name == declname

    ty = ty2idr(x.type)

    return f"(\"{ x.name }\", { "Ptr" if is_ptr else "" } ({ ty }))"

def ty2idr(node):
    # print(node)
    # assert node.quals == ["const"]
    match node:
        case c_ast.PtrDecl():
            return f"Ptr ({ ty2idr(node.type) })"

        case c_ast.TypeDecl():
            match node.type:
                case c_ast.IdentifierType():
                    match node.type.names:
                        case ["void"]:
                            return "()"

                        case ["unsigned", "char"]:
                            return "U8"

                        case ["unsigned", "short"]:
                            return "U16"

                        case ["int"]:
                            return "I64"
                        case ["unsigned", "int"]:
                            return "U64"

                        case ["uint16_t"]:
                            return "U16"
                        case ["int16_t"]:
                            return "I16"

                        case ["int32_t"]:
                            return "I32"
                        case ["uint32_t"]:
                            return "U32"

                        case ["int64_t"]:
                            return "I64"
                        case ["uint64_t"]:
                            return "U64"
                        case ["size_t"]:
                            return "U64"

                        case ["float"]:
                            return "F32"
                        case ["double"]:
                            return "F64"

                        case ["char"] | ["uint8_t"]:
                            return "U8"

                        case _:
                            assert node.type.names[0].startswith("WGPU") | node.type.names[0].startswith("GLFW"), node.type
                            return f"{node.type.names[0]}"

                case c_ast.Struct():
                    fields = [] if node.type.decls is None else [
                        getfield(x)
                        for x in node.type.decls
                    ]

                    return f"Struct \"{ node.type.name }\" [{ ",".join(fields) }]"

                case c_ast.Enum():
                    return "Enum"

                case _:
                    assert False, f"unknown type {node}"

        case c_ast.FuncDecl():
            args = [
                ty2idr(x.type)
                for x in node.args.params
            ]

            return " -> ".join(args) + " -> " + ty2idr(node.type)


        case c_ast.Typename():
            assert node.name is None
            return ty2idr(node.type)

        case c_ast.ArrayDecl():
            return f"List ({ ty2idr(node.type) })"

        case _:
            assert False, f"is {node.__class__} {node}"

def func2idr(node):
    args = [ty2idr(x.type) for x in node.type.args]
    if args == ["()"]:
        args = []

    args += [ f"PrimIO ({ ty2idr(node.type.type) })" ]

    return f"""
%foreign "C:{node.name},{LIBNAME}"
export
{node.name} : { " -> ".join(args) }
    """

def eval_constexpr(x):
    match x:
        case c_ast.BinaryOp(op="<<"):
            return f"(shiftL { eval_constexpr(x.left) } { eval_constexpr(x.right) })"
        case c_ast.BinaryOp(op="|"):
            return f"({ eval_constexpr(x.left) } .|. { eval_constexpr(x.right) })"
        case c_ast.Constant():
            return f"{ x.value }"
        case _:
            assert False, f"TODO: { x }"

class Visitor(c_ast.NodeVisitor):
    def visit_Decl(self, node) -> None:
        # print(node)
        match node.type:
            case c_ast.Struct():
                # forward declaration, ignore?
                return
            case c_ast.TypeDecl():
                print()
                print(f"{ node.type.declname } : { node.type.type.names[0] }")
                print(f"{ node.type.declname } = { eval_constexpr(node.init) }")
            case c_ast.FuncDecl():
                print(func2idr(node))
            case _:
                assert False, "TODO"

    def visit_Typedef(self, node) -> None:
        # ignore these
        if node.name in [
            "size_t",
            "int8_t",
            "uint8_t",
            "int16_t",
            "uint16_t",
            "int32_t",
            "uint32_t",
            "int64_t",
            "uint64_t",
        ]:
            return

        print()
        print("public export")
        print(f"{ node.name } : Type")
        print(f"{ node.name } = { ty2idr(node.type) }")

        if isinstance(node.type, c_ast.TypeDecl) and isinstance(node.type.type, c_ast.Enum):
            for el in node.type.type.values.enumerators:
                print()
                print("public export")
                print(f"{ el.name } : { node.name }")
                print(f"{ el.name } = { el.value.value }")

            # assert False, "TODO"


ast = parse_file(
    sys.argv[3],
    use_cpp = True,
    cpp_path = "clang",
    cpp_args=["-E", "-I" + os.getenv("FAKE_LIBC_INCLUDE")],
)

# print(ast)
print(f"""
module { sys.argv[2] }

import public System.FFI
import Data.Bits

import public Utils.CTypes

""")
Visitor().visit(ast)
