module ConcurrentTime where
  import Data.List

  data Event a b =  Event a [b]

  before (Event a ts) (Event b ps) | isPrefixOf ts ps = True 
  before (Event a ts) (Event b ps) | a == b =  ts <: ps
  before _ _ = False

  [x] <: (y:ys) = x < y 
  (x:xs) <: (y:ys) = x < y 

