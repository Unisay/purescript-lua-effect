{ name = "purescript-lua-effect"
, dependencies = [ "lua-prelude" ] 
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend =
    ''
    pslua \
    --foreign-path . \
    --ps-output output \
    --lua-output-file dist/Effect.lua \
    --entry Effect
    ''
}
