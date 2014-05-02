module PrimesSpec where
  import Test.QuickCheck
  import Primes
 
  forLargeNumbersPrimesIsFunctionallyEquivalentToPrimes' x = x > 20 ==> primes x == primes' x
 
  forSmallNumbersPrimesIsFunctionallyEquivalentToPrimes' x = x <= 20 ==> primes x == primes' x
