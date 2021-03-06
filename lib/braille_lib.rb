module Braille
  def braille_alphabet
    {
      "a" => "0.\n..\n..",
      "b" => "0.\n0.\n..",
      "c" => "00\n..\n..",
      "d" => "00\n.0\n..",
      "e" => "0.\n.0\n..",
      "f" => "00\n0.\n..",
      "g" => "00\n00\n..",
      "h" => "0.\n00\n..",
      "i" => ".0\n0.\n..",
      "j" => ".0\n00\n..",
      "k" => "0.\n..\n0.",
      "l" => "0.\n0.\n0.",
      "m" => "00\n..\n0.",
      "n" => "00\n.0\n0.",
      "o" => "0.\n.0\n0.",
      "p" => "00\n0.\n0.",
      "q" => "00\n00\n0.",
      "r" => "0.\n00\n0.",
      "s" => ".0\n0.\n0.",
      "t" => ".0\n00\n0.",
      "u" => "0.\n..\n00",
      "v" => "0.\n0.\n00",
      "w" => ".0\n00\n.0",
      "x" => "00\n..\n00",
      "y" => "00\n.0\n00",
      "z" => "0.\n.0\n00",
      "!" => "..\n00\n0.",
      "'" => "..\n..\n0.",
      "," => "0.\n0.\n..",
      "-" => "..\n..\n00",
      "." => "..\n00\n.0",
      "?" => "..\n0.\n00",
      " " => "..\n..\n..",
      "capital" => "..\n..\n.0",
      "#" => ".0\n.0\n00",
      "0" => ".0.0\n.000\n00..",
      "1" => ".00.\n.0..\n00..",
      "2" => ".00.\n.00.\n00..",
      "3" => ".000\n.0..\n00..",
      "4" => ".000\n.0.0\n00..",
      "5" => ".00.\n.0.0\n00..",
      "6" => ".000\n.00.\n00..",
      "7" => ".000\n.000\n00..",
      "8" => ".00.\n.000\n00..",
      "9" => ".0.0\n.00.\n00.."
    }
  end

  def letter_to_number
    {
      '#a' => '1',
      '#b' => '2',
      '#c' => '3',
      '#d' => '4',
      '#e' => '5',
      '#f' => '6',
      '#g' => '7',
      '#h' => '8',
      '#i' => '9',
      '#j' => '0'
    }
  end
end
