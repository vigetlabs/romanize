let arabic = validateInputOrExit(Process.arguments, "^[0-9]*$");

func one(place: Int) -> String {
    let ones = [ 0: "I", 1: "X", 2: "C", 3: "M" ]
    return ones[place] ?? "[no one]"
}

func four(place: Int) -> String {
    return "\(one(place))\(five(place))"
}

func five(place: Int) -> String {
    let fives = [ 0: "V", 1: "L", 2: "D" ]
    return fives[place] ?? "[no five]"
}

func nine(place: Int) -> String {
    return "\(one(place))\(one(place + 1))"
}


func romanize(number: Int, place: Int) -> String {
    var roman: String

    switch number {
    case 1...3:
        roman = "".join(Array(count: number, repeatedValue: one(place)))
    case 4:
        roman = four(place)
    case 5:
        roman = five(place)
    case 6...8:
        let ones = romanize(number - 5, place)
        roman = "\(five(place))\(ones)"
    case 9:
        roman = nine(place)
    default:
        roman = ""
    }

    return roman;
}

let characters = Array(arabic)
let numbersInReverse = characters.reverse().map { String($0).toInt()! }
let places = 0..<characters.count
let result = places.map { (numbersInReverse[$0], $0) }
    .map(romanize)
    .reverse()

print("".join(result))
