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
	cc -E -I $$FAKE_LIBC_INCLUDE src/c/wgpu-bindings.h

.PHONY: debug-header-glfw
debug-header-glfw:
	cc -E -I $$FAKE_LIBC_INCLUDE src/c/glfw-bindings.h

.PHONY: pdf
pdf:
	typst c --root . ./doc/cs5099/dis/main.typ

.PHONY: pdf-watch
pdf-watch:
	typst watch --root . ./doc/cs5099/dis/main.typ

.PHONY: open
open:
	open doc/cs5099/dis/

# :sh "make valgrind"
.PHONY: valgrind
valgrind:
	LD_LIBRARY_PATH="$(PWD)/build/exec/_tmpchez_app:$(LD_LIBRARY_PATH)" \
	DYLD_LIBRARY_PATH="$(PWD)/build/exec/_tmpchez_app:$(DYLD_LIBRARY_PATH)" \
	IDRIS2_INC_SRC="$(PWD)/build/exec/_tmpchez_app" \
	valgrind --gen-suppressions=all --leak-check=full --suppressions=under-the-rug.supp "$(PWD)/build/exec/_tmpchez_app/_tmpchez.ss" 2>&1 | tee leakck.txt

src/Graphics/WGPU/Sys.idr: src/c/wgpu-bindings.h scripts/c2idr.py 
	./scripts/c2idr.py libwgpu_native Graphics.WGPU.Sys $< > $@

src/Graphics/GLFW/Sys.idr: src/c/glfw-bindings.h scripts/c2idr.py 
	./scripts/c2idr.py libglfw Graphics.GLFW.Sys $< > $@
