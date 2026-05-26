all: src/Graphics/WGPU/Sys.idr src/Graphics/GLFW/Sys.idr

src/Graphics/WGPU/Sys.idr: src/c/wgpu-bindings.h scripts/c2idr.py 
	./scripts/c2idr.py libwgpu_native Graphics.WGPU.Sys $< > $@

src/Graphics/GLFW/Sys.idr: src/c/glfw-bindings.h scripts/c2idr.py 
	./scripts/c2idr.py libglfw Graphics.GLFW.Sys $< > $@
