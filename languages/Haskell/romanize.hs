import System.Environment(getArgs)
import Data.List(maximumBy)

(|>) :: a -> (a -> b) -> b
(|>) = flip ($)

conversions :: [(Char, Int)]
conversions =  [('I', 1),
                ('V', 5),
                ('X', 10),
                ('L', 50),
                ('C', 100),
                ('D', 500),
                ('M', 1000)]

highestContained :: Int -> (Char, Int)
highestContained arabic = conversions
                            |> filter (\(_, a) -> a <= arabic)
                            |> maximumBy (\(_, a1) (_, a2) -> compare a1 a2)

romanize :: [Char] -> Int -> [Char]
romanize roman arabic
  | (arabic == 0) = reverse roman
  | otherwise = romanize (r:roman) (arabic - a)
    where (r, a) = highestContained arabic

main :: IO ()
main = do
  args <- getArgs
  args |> head |> read |> romanize "" |> putStr
