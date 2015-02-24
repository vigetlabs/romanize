defmodule Deromanize do
  @conversions %{
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }

  def main(argv) do
    input = argv
    |> List.first

    IO.puts deromanize(input)
  end

  defp deromanize("", number), do: number
  defp deromanize(input, number \\ 0) do
    current = input |> String.at(0) |> integer_of
    next    = input |> String.at(1) |> integer_of

    if current < next, do: current = -current

    deromanize(String.slice(input, 1..-1), number + current)
  end

  defp integer_of(nil), do: 0
  defp integer_of(character) do
    @conversions[String.to_atom(character)]
  end
end
