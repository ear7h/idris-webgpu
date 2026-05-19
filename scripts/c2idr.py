#!/usr/bin/env python3

from pycparser import parse_file, c_ast
import sys
import os

def getfield(x):
    is_ptr = False
    if isinstance(x.type, c_ast.PtrDecl):
        is_ptr = True
        x.type = x.type.type

    # print(x.type)
    assert x.name == x.type.declname

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
                    assert len(node.type.names) == 1

                    match node.type.names[0]:
                        case "void":
                            return "()"

                        case "uint16_t":
                            return "U16"
                        case "int16_t":
                            return "I16"

                        case "int32_t":
                            return "I32"
                        case "uint32_t":
                            return "U32"

                        case "int64_t":
                            return "I64"
                        case "uint64_t":
                            return "U64"
                        case "size_t":
                            return "U64"

                        case "float":
                            return "F32"
                        case "double":
                            return "F64"

                        case "char" | "uint8_t":
                            return "U8"

                        case _:
                            assert node.type.names[0].startswith("WGPU"), node.type
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

        case _:
            assert False, f"is {node.__class__} {node}"

def func2idr(node):
    args = [ty2idr(x.type) for x in node.type.args]
    ret = ty2idr(node.type.type)

    return f"""
%foreign "C:{node.name},libwgpu_native"
{node.name} : { " -> ".join(args) } -> { ret }
    """

class Visitor(c_ast.NodeVisitor):
    def visit_Decl(self, node) -> None:
        if node.name is None or not node.name.startswith("wgpu"):
            return

        print(func2idr(node))

    def visit_Typedef(self, node) -> None:
        if not node.name.startswith("WGPU"):
            return

        print()
        print(f"{ node.name } : Type")
        print(f"{ node.name } = { ty2idr(node.type) }")

        if isinstance(node.type, c_ast.TypeDecl) and isinstance(node.type.type, c_ast.Enum):
            for el in node.type.type.values.enumerators:
                print()
                print(f"{ el.name } : { node.name }")
                print(f"{ el.name } = { el.value.value }")

            # assert False, "TODO"


ast = parse_file(
    sys.argv[1],
    use_cpp = True,
    cpp_path = "clang",
    cpp_args=["-E", "-I" + os.getenv("FAKE_LIBC_INCLUDE")],
)

# print(ast)
print("""
import System.FFI

U8 : Type
U8 = Bits8

I8 : Type
I8 = Bits8

U16 : Type
U16 = Bits16

I16 : Type
I16 = Bits16

U32 : Type
U32 = Bits32

I32 : Type
I32 = Bits32

U64 : Type
U64 = Bits64

I64 : Type
I64 = Bits64

Enum : Type
Enum = Bits32

F32 : Type
F32 = Bits32

F64 : Type
F64 = Bits64
""")
Visitor().visit(ast)
