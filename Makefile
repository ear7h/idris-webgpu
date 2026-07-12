.PHONY: all
all: \
	src/Graphics/WGPU/Sys.idr \
	src/Graphics/GLFW/Sys.idr

.PHONY: clean
clean:
	rm -rf build

.PHONY: repl
repl:
	rlwrap idris2 --repl idris-webgpu.ipkg

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
