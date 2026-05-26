{ pkgs ? import <nixpkgs> {} } : let
  glfw3webgpu = let
    src = pkgs.fetchgit {
      url = "https://github.com/eliemichel/glfw3webgpu";
      hash = "sha256-PYgjk6bFeUhH796vQRUINN5mpafRviZN+AemHuP7wtI=";
    };
  in pkgs.runCommandCC "glfw3webgpu" {
    src = src;
  } ''
    mkdir $out{,/lib,/include}
    cp $src/glfw3webgpu.h $out/include
    cc \
      -dynamiclib \
      -L${ pkgs.glfw }/lib \
      -I${ pkgs.glfw }/include \
      -I${ pkgs.wgpu-native.dev }/include \
      -lglfw \
      -o $out/lib/libglfw3webgpu.dylib \
      $src/glfw3webgpu.c
  '';
in pkgs.mkShell {
  IDRIS2_LIBS = with pkgs; lib.makeLibraryPath [
    wgpu-native
    glfw
    glfw3webgpu
  ];

  NIX_LDFLAGS = with pkgs; ''
    -F${apple-sdk}/Library/Frameworks
  '';

  C_INCLUDE_PATH = with pkgs; lib.makeIncludePath [
    wgpu-native.dev
    glfw
    glfw3webgpu
  ];

  FAKE_LIBC_INCLUDE = pkgs.fetchgit {
    url = "https://github.com/eliben/pycparser";
    sparseCheckout = [
      "utils/fake_libc_include"
    ];
    hash = "sha256-fZxZTUCC0T1UItXP8sQ2WljXFp4KradWYRbTkdCV2Ao=";
  } + "/utils/fake_libc_include";

  packages = with pkgs; [
    chez
    (python3.withPackages (py: with py; [
      pycparser
    ]))
  ];
}
