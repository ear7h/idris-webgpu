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

    if is_ptr and ty == "()":
        is_ptr = False
        ty = "AnyPtr"

    return f"(\"{ x.name }\", { "Ptr" if is_ptr else "" } ({ ty }))"

def ty2idr(node):
    # print(node)
    # assert node.quals == ["const"]
    match node:
        case c_ast.PtrDecl():
            inner = ty2idr(node.type)
            if inner == "()":
                return "AnyPtr"
            return f"Ptr ({ ty2idr(node.type) })"

        case c_ast.TypeDecl():
            match node.type:
                case c_ast.IdentifierType():
                    match node.type.names:
                        case ["void"]:
                            return "()"

                        case ["unsigned", "char"]:
                            return "Bits8"
                        case ["char"]:
                            return "Bits8"

                        case ["short"]:
                            return "Int16"
                        case ["unsigned", "short"]:
                            return "Bits16"

                        case ["int"]:
                            return "Int32"
                        case ["unsigned", "int"]:
                            return "Bits32"

                        case ["uint8_t"]:
                            return "Bits8"
                        case ["int8_t"]:
                            return "Int8"

                        case ["uint16_t"]:
                            return "Bits16"
                        case ["int16_t"]:
                            return "Int16"

                        case ["int32_t"]:
                            return "Int32"
                        case ["uint32_t"]:
                            return "Bits32"

                        case ["int64_t"]:
                            return "Int64"
                        case ["uint64_t"]:
                            return "Bits64"
                        case ["size_t"]:
                            return "Bits64"

                        case ["float"]:
                            return "Float"
                        case ["double"]:
                            return "Double"

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
                    return "Bits32"

                case _:
                    assert False, f"unknown type {node}"

        case c_ast.FuncDecl():
            args = [
                ty2idr(x.type)
                for x in node.args.params
            ]

            return " -> ".join(args) + " -> PrimIO (" + ty2idr(node.type) + ")"


        case c_ast.Typename():
            assert node.name is None
            return ty2idr(node.type)

        case c_ast.ArrayDecl():
            if node.dim is None:
                return f"Ptr ({ ty2idr(node.type) })"
            else:
                assert isinstance(node.dim, c_ast.Constant)
                return f"CArray { node.dim.value } ({ ty2idr(node.type) })"

        case _:
            assert False, f"is {node.__class__} {node}"

def func2idr(node):
    args = [f"{ ty2idr(x.type) }" for x in node.type.args]
    if args == ["()"]:
        args = []

    args += [ f"PrimIO ({ ty2idr(node.type.type) })" ]

    return f"""
%foreign "C:{node.name},{LIBNAME}"
export
{node.name} : { " -> ".join(args) }
    """

def ty2scheme(fieldty, enums):
    # print(fieldty)

    if isinstance(fieldty, c_ast.Struct):
        # print(fieldty.name)
        return "struct"

    match fieldty.names:
        case ["int8_t"]:
            return "integer-8"

        case ["uint8_t"]:
            return "unsigned-8"

        case ["int16_t"]:
            return "integer-16"

        case ["uint16_t"]:
            return "unsigned-16"

        case ["int32_t"]:
            return "integer-32"

        case ["uint32_t"]:
            return "unsigned-32"

        case ["int64_t"]:
            return "integer-64"

        case ["uint64_t"]:
            return "unsigned-64"

        case ["size_t"]:
            return "size_t"

        case ["unsigned", "char"] | ["char"]:
            return "char"

        case ["short"]:
            return "short"

        case ["unsigned", "short"]:
            return "unsigned-short"

        case ["int"]:
            return "int"

        case ["unsigned", "int"]:
            return "unsigned-int"

        case ["float"]:
            return "single-float"

        case ["double"]:
            return "double-float"

        case [name]:
            assert name in enums, f"expecte { name } to be enum"
            return "int"

        case _:
            # print(fieldty)
            # assert node.type.names[0].startswith("WGPU") | node.type.names[0].startswith("GLFW"), node.type
            # return f"{node.type.names[0]}"
            assert False, f"extra { fieldty }"

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
    def __init__(self):
        super().__init__()
        self.enums = set()
        self.structs = set()


    def visit_Decl(self, node) -> None:
        # print(node)
        match node.type:
            case c_ast.Struct():
                # forward declaration, ignore?
                return
            case c_ast.TypeDecl():
                print()
                print("public export")
                print(f"{ node.type.declname } : { ty2idr(node.type) }")
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
        ty = ty2idr(node.type)
        print(f"{ node.name } = { ty }")

        if isinstance(node.type.type, c_ast.Struct):
            print()

        if isinstance(node.type.type, c_ast.FuncDecl):
            print()
            print("export")
            print(f"%foreign \"C:mkFunctionPtr,libidris_wgpu_support\"")
            print(f"mk{ node.name } : ({ ty2idr(node.type.type) }) -> PrimIO $ { node.name }")


        if isinstance(node.type, c_ast.TypeDecl) and isinstance(node.type.type, c_ast.Enum):
            self.enums.add(node.name)

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
print(f"""\
module { sys.argv[2] }

import Data.Bits

import System.ScopedIO
import Utils.FFI
""")
Visitor().visit(ast)
