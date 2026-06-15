return {
  pureE = (function(a) return function() return a end end),
  bindE = (function(a) return function(f) return function() return f(a())() end end end),
  untilE = (function(f) return function() while not f() do end end end),
  whileE = (function(f) return function(a) return function() while f() do a() end end end end),
  forE = (function(lo) return function(hi) return function(f) return function() for i = lo, hi - 1 do f(i)() end end end end end),
  foreachE = (function(as) return function(f) return function() for i = 1, #as do f(as[i])() end end end end)
}
