import Foundation

func validateInputOrExit(arguments: [String], regex: String) -> String {
    if (arguments.count != 2) {
        println("Usage: \(arguments[0]) <arabic-or-roman-numeral>")
        exit(1)
    }

    let input : String = arguments[1]
    let validInput = input.rangeOfString(regex, options: .RegularExpressionSearch) != nil

    if validInput == false {
        println("Input must match /\(regex)")
        exit(2)
    }

    return input;
}
