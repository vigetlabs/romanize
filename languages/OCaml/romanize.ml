open Batteries

let conversions = [(1,    "I" );
                   (4,    "IV");
                   (5,    "V" );
                   (9,    "IX");
                   (10,   "X" );
                   (40,   "XL");
                   (50,   "L" );
                   (90,   "XC");
                   (100,  "C" );
                   (400,  "CD");
                   (500,  "D" );
                   (900,  "CM");
                   (1000, "M" )]

(* Return the highest Arabic/Roman pair less than or equal to number *)
let highest_contained arabic = conversions
                               |> List.filter ((>=) arabic % fst)
                               |> List.last

(* Recursively convert the Arabic number to a Roman numeral *)
let rec romanize arabic = match arabic with
  | 0 -> ""
  | n -> let (a, r) = highest_contained n in r ^ romanize (n - a);;

Array.get Sys.argv 1
  |> int_of_string
  |> romanize
  |> print_string
