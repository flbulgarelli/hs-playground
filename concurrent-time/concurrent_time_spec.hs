import Test.Hspec
import Test.QuickCheck
import ConcurrentTime as C 

-- This talks about event reception. It applies too to event procesing
--when selective message processing is disabled
main :: IO ()
main = hspec $ do
  describe "before" $ do
    it "is true for same actor, lower values, unitary length" $ do
        (Event "a" [1] `C.before` Event "a" [2]) `shouldBe` True

    it "is true for same actor, lower values, shorther length" $ do
        (Event "a" [1, 2, 1] `C.before` Event "a" [3, 2, 1]) `shouldBe` True

    it "is true for same actor, lower values, larger length" $ do
        (Event "a" [1, 2] `C.before` Event "a" [2]) `shouldBe` True

    it "is true for same actor, lower values, shorther length" $ do
        (Event "a" [1] `C.before` Event "a" [2, 1, 2, 3]) `shouldBe` True

    it "is true for different actors, prefix version, unitary length" $ do
        (Event "a" [1] `C.before` Event "b" [1, 1, 1]) `shouldBe` True

    it "is true for different actors, prefix version, non unitary length" $ do
        (Event "a" [1, 1] `C.before` Event "b" [1, 1, 3, 2]) `shouldBe` True

    it "is false for same actors, higher values, unitary length " $ do
        (Event "a" [2] `C.before` Event "a" [1]) `shouldBe` False

    it "is false for same actors, higher values, larger length " $ do
        (Event "a" [2] `C.before` Event "a" [1, 2, 3]) `shouldBe` False 

    it "is false for different actors, higher values, larger length " $ do
        (Event "a" [2] `C.before` Event "b" [1, 2, 3]) `shouldBe` False -- Unknown

    it "is false for different actors, lower values, larger length " $ do
        (Event "a" [1, 2, 3] `C.before` Event "b" [2]) `shouldBe` False -- Unknown

--sems weird but is correct. remember that first nth elements
-- was not procecessed necessary by same actor
    it "is false for different actors, non included values lower values" $ do
        (Event "a" [2] `C.before` Event "b" [3, 2, 3]) `shouldBe` False -- Unknown

