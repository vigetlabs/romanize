import Foundation

func decompose<T>(array: [T]) -> (T, [T])? {
    return array.count > 0 ? (array[0], Array(array[1..<array.count])) : nil;
}

func valueOfRoman(numeral: Character) -> Int {
    return ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000][numeral] ?? 0
}

func considerNextCharacter(current: Character, rest:[Character], value: Int) -> ([Character], Int) {
    let currentValue = valueOfRoman(current)
    var result = (rest, value + currentValue)

    if let (next, restWithoutNext) = decompose(rest) {
        let nextValue = valueOfRoman(next)

        if currentValue < nextValue {
            result = (restWithoutNext, value + (nextValue - currentValue))
        }
    }

    return result
}

func deromanize(numerals: [Character], value: Int) -> String {
    if let (head, tail) = decompose(numerals) {
        let (rest, newValue) = considerNextCharacter(head, tail, value)
        return deromanize(rest, newValue)
    } else {
        return String(value)
    }
}

func deromanize(numeral: String) -> String {
    return deromanize(Array(numeral), 0)
}

let roman = validateInputOrExit(Process.arguments, "^[MDCLXVI]*");
let result = deromanize(roman)
print(result)