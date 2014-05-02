sumWhile g acum [] =  (g, [])
sumWhile g acum ys@(x:xs) | acum' > 0 = sumWhile (max g acum') acum' xs
                          | otherwise = (g, dropWhile (<0) ys)
                               where acum' = x + acum 


maximize ys | null xs = g
            | otherwise = max g (maximize xs) 
           where (g, xs) = sumWhile 0 0 ys


maximizeDebug ys 
     | null xs = (g, [g])
     | otherwise = (max g g', g:gs) 
              where (g, xs) = sumWhile 0 0 ys
                    (g', gs) = maximize' xs
