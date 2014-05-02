module Primes where
  primes' max = [x | (x, d) <- take max $ zip [0..]  $  foldl1 (zipWith (||))  [c n | n <- [2..(div max 2)]], not d]

  primes max = takeWhile (<=max) $ filter (isPrime) [0..]

  isPrime n = not $ any ((==0).(rem n))  [2..(div n 2)]

  c n = replicate (2*n) False ++  m n
  m n = cycle $ True : replicate (n-1) False



