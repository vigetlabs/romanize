open Batteries

let conversions = [('I', 1);
                   ('V', 5);
                   ('X', 10);
                   ('L', 50);
                   ('C', 100);
                   ('D', 500);
                   ('M', 1000)]

(* Return the Arabic value of the Roman numeral *)
let value_of roman = List.assoc roman conversions

(* Recursively calcluate the Arabic value of the Roman numeral *)
let rec deromanize roman = match roman with
  | []             -> 0
  | [r]            -> value_of r
  | r1 :: r2 :: rs -> let v1 = value_of r1
                      and v2 = value_of r2 in
                      (if v1 < v2 then -v1 else v1) + deromanize (r2 :: rs);;

Array.get Sys.argv 1
  |> String.to_list
  |> deromanize
  |> string_of_int
  |> print_string
