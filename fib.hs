-- naif recursive version
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- tail recursive version
fib' 0 = 1
fib' 1 = 1
fib' n = fibR 1 1 (n-2)

fibR x0 x1 0 = x0 + x1
fibR x0 x1 n = fibR x1 (x0+x1) (n-1)

-- iterative version
fib'' n  = (!!n) . map fst . iterate (\(x0, x1) -> (x1, (x0 + x1)))  $ (1, 1) 

fib''' n  =  f 1 1 !! n

f x0 x1 = x0 : f x1 (x0 + x1)


while c a i = if (c a) then while c (i a) i else a

fib'''' n = case n of
              0 -> 1
              1 -> 1
              _ -> let (_,r,_) = while (\(_, _, i) -> i <= n-2) (1, 1, 0) (\(x0, x1, i) -> (x1, x0 + x1, i + 1)) 
                   in r
