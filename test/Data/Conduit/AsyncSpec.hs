module Data.Conduit.AsyncSpec where
import Test.Hspec

import Data.Conduit.Async
import Data.Conduit
import qualified Data.Conduit.List as CL

spec :: Spec
spec = describe "Data.Conduit.Async" $
    it "maintains order on mapAsync" $ do
        let source = CL.sourceList "abcdefg"
        res <- runConduit $ source .| mapAsync 3 return .| CL.consume
        res `shouldBe` "abcdefg"

main :: IO ()
main = hspec spec
