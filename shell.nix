{ pkgs ? import <nixpkgs> {} } : let
in pkgs.mkShell {
  DYLD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.wgpu-native
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.wgpu-native
  ];

  C_INCLUDE_PATH = pkgs.lib.makeIncludePath [
    pkgs.wgpu-native.dev
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
