module Compress where
  val = Just
  nil = Nothing :: Maybe Integer 
  
  left = reverse.right.reverse
  
  right [x]                 = [x]
  right (Nothing:xs)        = Nothing:right xs
  right (Just x:Nothing:xs) = Nothing:right (Just x:xs)
  right (Just x:xs)  = tryRight (Just x) (right xs)

  tryRight value xs@(Nothing:_)             = right (value:xs)
  tryRight (Just x) (Just y:xs) | x == y    = Nothing:Just (2*x):xs
                                | otherwise = Just x:Just y:xs

