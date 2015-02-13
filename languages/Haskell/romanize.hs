import System.Environment(getArgs)
import Data.List(find)
import Text.Printf(printf)

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

-- | Given a Roman character, get its Arabic value
valueOf :: Char -> Int
valueOf roman = case lookup roman conversions of
  Just i  -> i
  Nothing -> roman |> printf "Invalid Roman numeral: %c" |> error

-- | Given an Arabic number, return its Roman/Arabic pair or nothing
possibleRoman :: Int -> Maybe (Char, Int)
possibleRoman number = find ((number ==) . snd) conversions

-- | Given an Arabic number, return its Roman character
romanOf :: Int -> Char
romanOf number = case possibleRoman number of
  Just i  -> fst i
  Nothing -> number |> printf "No Roman numeral for %i" |> error

-- | Return the highest Roman/Arabic pair less than or equal to the number
highestContained :: Int -> (Char, Int)
highestContained arabic = conversions |> filter ((arabic >=) . snd) |> last

-- | Are the first four Roman characters all the same and is there a Roman
-- | character for five times their value?
firstFourCombinable :: [Char] -> Bool
firstFourCombinable roman
  | (length roman < 4) = False
  | otherwise = case first |> valueOf |> (5 *) |> possibleRoman of
    Just _  -> all (first ==) (take 4 roman)
    Nothing -> False
    where
      first = head roman

-- | Combine the first four characters
-- | E.g. IIII -> IV
combineFirstFour :: [Char] -> [Char]
combineFirstFour roman = big_roman : small_roman : (drop 4 roman)
  where
    small_roman = head roman
    big_roman   = romanOf (5 * valueOf small_roman)

-- | Are the first and third Roman characters the same and is there a Roman
-- | character for their double?
firstAndThirdCombinable :: [Char] -> Bool
firstAndThirdCombinable roman
  | (length roman < 3) = False
  | otherwise = case first |> valueOf |> (2 *) |> possibleRoman of
    Just _  -> first == third
    Nothing -> False
    where
      first = head roman
      third = roman !! 2

-- | Combine the first and third characters
-- | E.g. VIV -> IX
combineFirstAndThird :: [Char] -> [Char]
combineFirstAndThird roman = big_roman : small_roman : (drop 3 roman)
  where
    small_roman = roman !! 1
    big_roman   = roman |> head |> valueOf |> (2 *) |> romanOf

-- | Given a string of Roman characters and an integer, recursively:
-- | 1. Combine first four characters if possible
-- | 2. Combine first and third characters if possible
-- | 3. Reverse the Roman string and return it if Arabic number is zero
-- | 4. Find the largest Roman character that fits wthin the Arabic
-- |    number, add it to the string, subtract its value from the number
romanize :: [Char] -> Int -> [Char]
romanize roman arabic
  | firstFourCombinable roman     = romanize (combineFirstFour roman) arabic
  | firstAndThirdCombinable roman = romanize (combineFirstAndThird roman) arabic
  | arabic == 0                   = reverse roman
  | otherwise                     = romanize (r:roman) (arabic - a)
                                    where (r, a) = highestContained arabic

main :: IO ()
main = do
  args <- getArgs
  args |> head |> read |> romanize "" |> putStr
