
%foreign "C:wgpuCreateInstance,libwgpu_native"
wgpu_wgpuCreateInstance : AnyPtr -> AnyPtr


main : IO ()
main = putStrLn $ show $ prim__nullAnyPtr $ wgpu_wgpuCreateInstance prim__getNullAnyPtr
