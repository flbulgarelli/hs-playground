
-- \x -> x^2 + x  
-- f 0 = 0
-- f 1 = 0 + 2 * 1
-- f 2 = 0 + 2 * 1 + 2 * 2
-- f 3 = 0 + 2 * 1 + 2 * 2 + 2 * 3 = 0 + 2 * (1 + 2 + 3) = 0 + 2 * ( sum [1..n] )

f 0 = 0 
f n = f (n-1) + 2 * n

f' = fAcc 0

fAcc acc 0 = acc
fAcc acc n = fAcc (acc + 2 * n) (n-1)

sum' :: Num a => [a] -> a
sum' = sumAcc 0

sumAcc acc [] = acc
sumAcc acc (x:xs) = sumAcc (x+acc) xs  
