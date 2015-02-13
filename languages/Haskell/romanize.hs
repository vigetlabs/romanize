import System.Environment(getArgs)
import Data.List(maximumBy, find)

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

valueOf :: Char -> Int
valueOf roman = case lookup roman conversions of
  Just i  -> i
  Nothing -> error "Invalid Roman numeral"

romanOf :: Int -> Char
romanOf number = case find (\(_, a) -> a == number) conversions of
  Just i  -> fst i
  Nothing -> error "Something has gone awry in romanOf"

highestContained :: Int -> (Char, Int)
highestContained arabic = conversions
                            |> filter (\(_, a) -> a <= arabic)
                            |> maximumBy (\(_, a1) (_, a2) -> compare a1 a2)

fourth :: [Char] -> Char -> Bool
fourth roman ch
  | (length roman < 3) = False
  | (all (ch ==) (take 3 roman)) = True
  | otherwise = False

compactTwo :: [Char] -> [Char]
compactTwo roman
  | (length roman < 3) = roman
  | (head roman == roman !! 2) = big_roman : small_roman : (drop 3 roman)
  | otherwise = roman
    where
      small_roman = roman !! 1
      big_roman   = romanOf (2 * valueOf (head roman))

compactFour :: [Char] -> [Char]
compactFour roman = compactTwo (big_roman : small_roman : (drop 4 roman))
    where
      small_roman = head roman
      big_roman   = romanOf (5 * valueOf small_roman)

romanize :: [Char] -> Int -> [Char]
romanize roman arabic
  | (arabic == 0) = reverse roman
  | (fourth roman r) = romanize (compactFour (r:roman)) (arabic - a)
  | otherwise = romanize (r:roman) (arabic - a)
    where (r, a) = highestContained arabic

main :: IO ()
main = do
  args <- getArgs
  args |> head |> read |> romanize "" |> putStr
