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
in pkgs.mkShell {
  IDRIS2_LIBS = with pkgs; lib.makeLibraryPath [
    wgpu-native
    glfw
  ];

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
