## List represents the Calibration Values that the elves need to recover
# Calibration Value is found by combining the FIRST and LAST digit to form a SINGLE DIGIT
# Find the sum of all Calibration Values

defmodule Calibration do
  def part_one do
    File.read!("test.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> Calibration.parse_digits(x) end)
    |> Enum.sum()
  end

  def part_two do
    File.read!("test.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> Calibration.parse_letters(x) end)
    |> IO.inspect()
    |> Enum.sum()
    |> IO.inspect()
  end

  def parse_letters(input) do
    pattern = ~r/(one|two|three|four|five|six|seven|eight|nine)/
    first_digimon = String.replace(input, pattern, fn x -> case x do 
      "one" -> "1"
      "two" -> "2"
      "three" -> "3"
      "four" -> "4"
      "five" -> "5"
      "six" -> "6"
      "seven" -> "7"
      "eight" -> "8"
      "nine" -> "9"
    end 

    end, global: false)
    |> Calibration.get_first_digit()

    reversed_digimon = String.reverse(input)

    reversed_pattern = ~r/(eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)/

      last_digimon = String.replace(reversed_digimon, reversed_pattern, fn x -> 
        case x do
        "eno" -> "1"
        "owt" -> "2"
        "eerht" -> "3"
        "ruof" -> "4"
        "evif" -> "5"
        "xis" -> "6"
        "neves" -> "7"
        "thgie" -> "8"
        "enin" -> "9"
      end
      end, global: false)
      |> IO.inspect()
      |> Calibration.get_first_digit()

      combined = first_digimon <> last_digimon


      String.to_integer(combined)

  end

  def get_first_digit(string) do
    String.replace(string, ~r/\D/, "")
             |> String.split("", trim: true)
             |> List.first()
  end


  def parse_digits(input) do
    only_digits = String.replace(input, ~r/\D/, "")
    |> String.split("", trim: true)
    first_digit = List.first(only_digits)
    last_digit = List.last(only_digits)

    combined = first_digit <> last_digit

    String.to_integer(combined)
  end

end


Calibration.part_two()
