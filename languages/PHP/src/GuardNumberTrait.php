<?php

trait GuardNumberTrait {

    private function guardAgainstInvalidNumber($number)
    {
        if ($number <= 0)
        {
            throw new InvalidArgumentException;
        }
    }

    private function guardAgainstInvalidRomanNumeral($number)
    {
        if (!ctype_alpha($number))
        {
            throw new InvalidArgumentException;
        }
    }
}
