-- Regression guard: runEffectFn10 must forward all ten arguments.
--
-- The FFI bound ten curried parameters a..j but called the underlying
-- function with only nine (a..i), silently dropping j. This loads the
-- FFI table directly and checks that every argument reaches `fn`.
local M = assert(dofile("src/Effect/Uncurried.lua"))

local seen
local recorder = function(...)
  seen = {...}
  return nil
end

-- runEffectFn10(fn)(a)(b)...(j)() applies fn to all ten arguments.
M.runEffectFn10(recorder)(1)(2)(3)(4)(5)(6)(7)(8)(9)(10)()

assert(seen ~= nil, "fn was never called")
assert(#seen == 10, "expected 10 forwarded arguments, got " .. #seen)
for k = 1, 10 do assert(seen[k] == k, "argument #" .. k .. " not forwarded (got " .. tostring(seen[k]) .. ")") end

print("OK runEffectFn10 forwards all ten arguments")
