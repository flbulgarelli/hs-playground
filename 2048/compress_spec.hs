import Test.Hspec
import Test.QuickCheck
import Compress

main :: IO ()
main = hspec $ do
  describe "left" $ do
    it "empty slice" $ do
      left [nil,   nil, nil,   nil]     `shouldBe` [nil, nil,   nil, nil]

    it "moves one step" $ do
      left [nil,   val 2, nil,   nil]   `shouldBe` [val 2, nil,   nil, nil]

    it "moves mutiple steps" $ do
      left [nil,   nil,   nil,   val 2] `shouldBe` [val 2, nil,   nil, nil]

    it "does simple merge" $ do
      left [val 2, val 2, nil,   nil]   `shouldBe` [val 4, nil,   nil, nil]

    it "does complex merge" $ do
      left [val 2, val 2, val 2, val 2] `shouldBe` [val 4, val 4, nil, nil]

    it "does not merge when impossible" $ do
      left [nil,   val 2, val 4, nil]   `shouldBe` [val 2, val 4, nil, nil]
