import System.Environment(getArgs)

(|>) :: a -> (a -> b) -> b
(|>) = flip ($)

conversions :: [(Int, [Char])]
conversions =  [(1,    "I" ),
                (4,    "IV"),
                (5,    "V" ),
                (9,    "IX"),
                (10,   "X" ),
                (40,   "XL"),
                (50,   "L" ),
                (90,   "XC"),
                (100,  "C" ),
                (400,  "CD"),
                (500,  "D" ),
                (900,  "CM"),
                (1000, "M" )]

-- | Return the highest Roman/Arabic pair less than or equal to the number
highestContained :: Int -> (Int, [Char])
highestContained arabic = conversions
                          |> filter ((arabic >=) . fst)
                          |> last

-- | Recursively convert the Arabic number to a Roman numeral
romanize :: Int -> [Char]
romanize arabic
  | arabic == 0 = ""
  | otherwise   = r ++ romanize (arabic - a)
                  where (a, r) = highestContained arabic

main :: IO ()
main = do
  args <- getArgs
  args |> head |> read |> romanize |> putStr
