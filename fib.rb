def fib n
  return 1 if n == 0
  return 1 if n == 1
  x0 = 1
  x1 = 1
  i = 0
  while ( n - 2 >=i) do
    xn = x1 + x0
    x0 = x1
    x1 = xn
    i+=1
  end
  x1
end
