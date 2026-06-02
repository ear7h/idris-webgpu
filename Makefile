.PHONY: all
all: \
	build/exec/_tmpchez_app/libidris_wgpu_support.dylib \
	src/Graphics/WGPU/Sys.idr \
	src/Graphics/GLFW/Sys.idr

.PHONY: setup
setup: \
	build/exec/_tmpchez_app \
	build/exec/_tmpchez_app/libidris_wgpu_support.dylib

.PHONY: clean
clean:
	rm -rf build

.PHONY: repl
repl:
	rlwrap idris2 --repl idris-webgpu.ipkg


build/exec/_tmpchez_app:
	echo ":exec main" | idris2 --repl idris-webgpu.ipkg
	install_name_tool -id libglfw.dylib $(PWD)/build/exec/_tmpchez_app/libglfw.dylib
	install_name_tool -id libwgpu_native.dylib $(PWD)/build/exec/_tmpchez_app/libwgpu_native.dylib

build/exec/_tmpchez_app/libidris_wgpu_support.dylib: ./src/c/idris_wgpu_support.c
	LIBRARY_PATH=$(PWD)/build/exec/_tmpchez_app/ cc -dynamiclib -lglfw -o $@ ./src/c/idris_wgpu_support.c

.PHONY: debug-header-wgpu
debug-header-wgpu:
	clang -E -I $$FAKE_LIBC_INCLUDE src/c/wgpu-bindings.h

.PHONY: debug-header-glfw
debug-header-glfw:
	clang -E -I $$FAKE_LIBC_INCLUDE src/c/glfw-bindings.h

src/Graphics/WGPU/Sys.idr: src/c/wgpu-bindings.h scripts/c2idr.py 
	./scripts/c2idr.py libwgpu_native Graphics.WGPU.Sys $< > $@

src/Graphics/GLFW/Sys.idr: src/c/glfw-bindings.h scripts/c2idr.py 
	./scripts/c2idr.py libglfw Graphics.GLFW.Sys $< > $@
