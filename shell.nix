{ pkgs ? import <nixpkgs> {} } : let
  glfw3webgpu = let
    src = pkgs.fetchgit {
      url = "https://github.com/eliemichel/glfw3webgpu";
      hash = "sha256-PYgjk6bFeUhH796vQRUINN5mpafRviZN+AemHuP7wtI=";
    };
  in pkgs.runCommandCC "glfw3webgpu" {
    src = src;
  } ''
    mkdir -p $out/include
    cp $src/glfw3webgpu.{c,h} $out/include
  '';

  idrisWGPUSupport = pkgs.runCommandCC "idrisWGPUSupport" {
    OBJC_INCLUDE_PATH = with pkgs; lib.makeIncludePath [
      wgpu-native.dev
      glfw
      glfw3webgpu
    ];

    C_INCLUDE_PATH = with pkgs; lib.makeIncludePath
      (pkgs.lib.optionals pkg.stdenv.isLinux
        [
          wgpu-native.dev
          glfw
          glfw3webgpu
          wayland.dev
          libGL
        ]);

    LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
      wgpu-native
      glfw
    ];
  }
  (
    if pkgs.stdenv.isDarwin
    then
      ''
        mkdir -p $out/lib

        cc -dynamiclib \
          -framework Cocoa \
          -framework CoreVideo \
          -framework IOKit \
          -framework QuartzCore \
          -lglfw -lwgpu_native \
          -o $out/lib/libidris_wgpu_support.dylib \
          -x objective-c \
          ${ ./src/c/idris_wgpu_support.c }
      ''
    else
      ''
        mkdir -p $out/lib

        cc -shared \
          -lglfw -lwgpu_native \
          -fPIC \
          -o $out/lib/libidris_wgpu_support.so \
          ${ ./src/c/idris_wgpu_support.c }
      ''
  );
  idris2-ear7h = (pkgs.idris2.unwrapped.overrideAttrs (old: {
    src = pkgs.fetchgit {
      url = "https://github.com/ear7h/idris2";
      rev = "f38c0ad";
      hash = "sha256-2NStzz8xpOR9SeuVHvxSWVor9YNTbDGfJMnDd/UV04c=";
    };
  })).withPackages (x: [ ]);
  libPath = with pkgs; lib.makeLibraryPath [
    wgpu-native
    glfw
    idrisWGPUSupport
    libGL
    "/run/opengl-driver/"
  ];
in pkgs.mkShell {
  IDRIS2_SH =
    if pkgs.stdenv.isDarwin
    then "${pkgs.coreutils}/bin/env DYLD_LIBRARY_PATH=${libPath} ${pkgs.bash}/bin/sh"
    else "/bin/sh";

  LD_LIBRARY_PATH = libPath;

  C_INCLUDE_PATH = with pkgs; lib.makeIncludePath [
    wgpu-native.dev
    glfw
    glfw3webgpu
  ];

  FAKE_LIBC_INCLUDE = pkgs.fetchgit {
    url = "https://github.com/eliben/pycparser";
    rev = "release_v3.00";
    sparseCheckout = [
      "utils/fake_libc_include"
    ];
    hash = "sha256-A/VVi523667bpz/h8hc3f1QeG7ymcfgsbeFH2XAHx9c=";
  } + "/utils/fake_libc_include";

  buildInputs = with pkgs; [
    idris2-ear7h
    chez
    cowsay
    (python3.withPackages (py: with py; [
      pycparser
      numpy
    ]))
  ] ++ (pkgs.lib.optional pkgs.stdenv.isLinux pkgs.valgrind);
}
