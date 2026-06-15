-- Regression guard for the Lua 5.1 FFI of Effect (control flow).
--
-- #78 forE lo hi f iterates over the half-open range [lo, hi) — lo inclusive,
-- hi EXCLUSIVE (per Effect.purs and the JS `for (i = lo; i < hi; i++)`). Lua's
-- numeric `for i = lo, hi` is inclusive of the upper bound, so the naive port
-- ran one extra iteration and never produced an empty range. The fix uses
-- `for i = lo, hi - 1`.
--
-- `Effect a` here is a zero-arg thunk; `f :: Int -> Effect Unit` is a curried
-- `function(i) return function() ... end end`.
-- Run from the repo root: `lua test/regression/effect.lua`.
local E = dofile("src/Effect.lua")

local failures = 0

local function check(name, cond, detail)
  if cond then
    print("ok   - " .. name)
  else
    failures = failures + 1
    print("FAIL - " .. name .. ": " .. tostring(detail))
  end
end

-- Run forE over [lo, hi) and return the list of indices it visited.
local function visited(lo, hi)
  local seen = {}
  local function f(i) return function() seen[#seen + 1] = i end end
  E.forE(lo)(hi)(f)()
  return seen
end

local function showList(t)
  local parts = {}
  for i = 1, #t do parts[i] = tostring(t[i]) end
  return "{" .. table.concat(parts, ", ") .. "}"
end

local function eqList(a, b)
  if #a ~= #b then return false end
  for i = 1, #a do if a[i] ~= b[i] then return false end end
  return true
end

--------------------------------------------------------------------------------
-- #78 forE iterates over [lo, hi) (hi exclusive) -----------------------------

do
  local got = visited(0, 3)
  check("forE 0 3 visits 0,1,2 (hi exclusive)", eqList(got, {0, 1, 2}), "got " .. showList(got))
end

do
  local got = visited(1, 5)
  check("forE 1 5 visits 1,2,3,4", eqList(got, {1, 2, 3, 4}), "got " .. showList(got))
end

do
  local got = visited(2, 2)
  check("forE n n is an empty range (zero iterations)", #got == 0, "got " .. showList(got))
end

do
  local got = visited(5, 3)
  check("forE lo>hi is empty", #got == 0, "got " .. showList(got))
end

--------------------------------------------------------------------------------
-- foreachE iterates the whole array 1..#as (sanity: NOT off-by-one) ----------

do
  local seen = {}
  local function f(x) return function() seen[#seen + 1] = x end end
  E.foreachE({10, 20, 30})(f)()
  check("foreachE visits every element", eqList(seen, {10, 20, 30}), "got " .. showList(seen))
end

--------------------------------------------------------------------------------

if failures > 0 then error(failures .. " regression check(s) failed") end
print("purescript-lua-effect: all FFI regression checks passed")
