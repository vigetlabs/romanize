require "minitest/autorun"

class RomanizeTest < MiniTest::Test
  CONVERSIONS = {
     "I"          => "1",
     "II"         => "2",
     "III"        => "3",
     "IV"         => "4",
     "V"          => "5",
     "VI"         => "6",
     "VII"        => "7",
     "VIII"       => "8",
     "IX"         => "9",
     "X"          => "10",
     "XI"         => "11",
     "XII"        => "12",
     "XIII"       => "13",
     "XIV"        => "14",
     "XV"         => "15",
     "XVI"        => "16",
     "XVII"       => "17",
     "XVIII"      => "18",
     "XIX"        => "19",
     "XX"         => "20",
     "XXX"        => "30",
     "XL"         => "40",
     "L"          => "50",
     "LX"         => "60",
     "LXX"        => "70",
     "LXXX"       => "80",
     "XC"         => "90",
     "C"          => "100",
     "CC"         => "200",
     "CCC"        => "300",
     "CD"         => "400",
     "D"          => "500",
     "DC"         => "600",
     "DCC"        => "700",
     "DCCC"       => "800",
     "CM"         => "900",
     "M"          => "1000",
     "MMMCMXLVII" => "3947"
  }

  CONVERSIONS.each do |roman, arabic|
    define_method "test_#{arabic}_romanizes_to_#{roman}" do
      assert_equal roman, `#{ENV["LANGUAGE_PATH"]}/romanize #{arabic}`.strip
    end

    define_method "test_#{roman}_deromanizes_to_#{arabic}" do
      assert_equal arabic, `#{ENV["LANGUAGE_PATH"]}/deromanize #{roman}`.strip
    end
  end
end
