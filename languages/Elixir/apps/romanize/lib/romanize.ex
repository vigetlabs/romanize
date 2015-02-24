defmodule Romanize do
  @conversions %{
    I:  1,
    IV: 4,
    V:  5,
    IX: 9,
    X:  10,
    XL: 40,
    L:  50,
    XC: 90,
    C:  100,
    CD: 400,
    D:  500,
    CM: 900,
    M:  1000
  }

  def main(argv) do
    number = argv
    |> List.first
    |> String.to_integer

    IO.puts romanize(number)
  end

  defp romanize(number, result \\ "")
  defp romanize(0, result), do: result
  defp romanize(number, result) do
    value = highest_under number
    roman = roman_of value

    romanize(number - value, result <> roman)
  end

  defp highest_under(integer) do
    @conversions
    |> Map.values
    |> Enum.filter(&(&1 <= integer))
    |> Enum.max
  end

  defp roman_of(integer) do
    @conversions
    |> Map.keys
    |> Enum.filter(&(@conversions[&1] == integer))
    |> List.first
    |> Atom.to_string
  end
end
