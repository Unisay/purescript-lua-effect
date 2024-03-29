let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20240309/packages.dhall
        sha256:43d31f4e3219afaaf823598a4386dfc8003a80d173599ddd0491f6b10707aaa0

let upstream-lua =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.15-20240316/packages.dhall
        sha256:7b06cd9f2f8872b6c04b22a5af74511a94bbfaaa0ee64e936e28a09ad08d4995

in  upstream-ps // upstream-lua
