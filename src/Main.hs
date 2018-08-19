{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Text (Text, strip)


main :: IO ()
main = putStrLn "Hello, Haskell!"

test :: Text
test = strip "test"