let arabic = validateInputOrExit(Process.arguments, "^[0-9]*$");

func one(powerOfTen: Int) -> String {
    let ones = [ 0: "I", 1: "X", 2: "C", 3: "M" ]
    return ones[powerOfTen] ?? "[no one value for 10^\(powerOfTen)s place]"
}

func four(powerOfTen: Int) -> String {
    return "\(one(powerOfTen))\(five(powerOfTen))"
}

func five(powerOfTen: Int) -> String {
    let fives = [ 0: "V", 1: "L", 2: "D" ]
    return fives[powerOfTen] ?? "[no five value for 10^\(powerOfTen)s place]"
}

func nine(powerOfTen: Int) -> String {
    return "\(one(powerOfTen))\(one(powerOfTen + 1))"
}

func romanize(number: Int, powerOfTen: Int) -> String {
    var roman: String

    switch number {
    case 1...3:
        roman = "".join(Array(count: number, repeatedValue: one(powerOfTen)))
    case 4:
        roman = four(powerOfTen)
    case 5:
        roman = five(powerOfTen)
    case 6...8:
        let five = romanize(5, powerOfTen)
        let ones = romanize(number - 5, powerOfTen)
        roman = "\(five)\(ones)"
    case 9:
        roman = nine(powerOfTen)
    default:
        roman = ""
    }

    return roman;
}

let characters = Array(arabic)
let numbersInReverse = characters.reverse().map { String($0).toInt()! }
let powersOfTen = 0..<characters.count
let result = powersOfTen.map { (numbersInReverse[$0], $0) }
    .map(romanize)
    .reverse()

print("".join(result))
