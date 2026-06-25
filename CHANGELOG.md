# Changelog

Notable changes to this Lua fork of `purescript-effect` are recorded here. The fork
tracks its own release line (Lua 5.1 FFI on the [pslua](https://github.com/purescript-lua/purescript-lua)
compiler); the upstream PureScript history is preserved below. The format
is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and
fork entries are assembled from fragments in `changelog.d/` with
[scriv](https://scriv.readthedocs.io/) on each release.

<!-- scriv-insert-here -->

## v4.1.3 - 2026-06-15

### Fixed

- `forE` iterates the half-open range `[lo, hi)` (#78).

## v4.1.2 - 2026-06-14

### Fixed

- `foreachE` iterates with a numeric loop (luacheck-clean).

## v4.1.1 - 2026-06-14

### Fixed

- `runEffectFn10` forwards its tenth argument.

<!-- scriv-end-here -->

---

The sections below are inherited from the upstream PureScript project and
predate the Lua fork.

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:

## [v4.0.0](https://github.com/purescript/purescript-effect/releases/tag/v4.0.0) - 2022-04-27

Breaking changes:
- Migrate FFI to ES modules (#29 by @kl0tl and @JordanMartinez)

New features:

Bugfixes:

Other improvements:

## [v3.0.0](https://github.com/purescript/purescript-effect/releases/tag/v3.0.0) - 2021-02-26

Breaking changes:
  - Added support for PureScript 0.14 and dropped support for all previous versions (#21)

New features:
- Added roles declarations to allow safe coercions (#20) 
- Added monoid instances for uncurried `EffectFn`s (#13)

Bugfixes:

Other improvements:
  - Migrated CI to GitHub Actions and updated installation instructions to use Spago (#22)
  - Added a CHANGELOG.md file and pull request template (#25, #26)
  - Removed `return {}` from FFI functions for a small performance boost (#18)

## [v2.0.1](https://github.com/purescript/purescript-effect/releases/tag/v2.0.1) - 2019-01-26

Documentation tweaks and additions (@hdgarrood, @paldepind)

## [v2.0.0](https://github.com/purescript/purescript-effect/releases/tag/v2.0.0) - 2018-05-22

Updated for PureScript 0.12

## [v1.1.0](https://github.com/purescript/purescript-effect/releases/tag/v1.1.0) - 2018-04-19

- Added `Monoid` and `Semigroup` instances (@i-am-tom)

## [v1.0.0](https://github.com/purescript/purescript-effect/releases/tag/v1.0.0) - 2018-04-12



