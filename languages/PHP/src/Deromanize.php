<?php

class Deromanize {

    use GuardNumberTrait;

    protected static $lookup = [
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000,
    ];

    public function convert($number)
    {
        $this->guardAgainstInvalidRomanNumeral($number);

        $solution = 0;

        while(strlen($number) > 1)
        {
            $current = static::$lookup[$number[0]];
            $next    = static::$lookup[$number[1]];

            if ($current >= $next)
            {
                $solution += $current;
                $number = substr($number, 1);
            }
            else
            {
                $solution += $next - $current;
                $number = substr($number, 2);
            }
        }

        if ($number)
        {
            $solution += static::$lookup[$number];
        }

        return $solution;
    }
}
