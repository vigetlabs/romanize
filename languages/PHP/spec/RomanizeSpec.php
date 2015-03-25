<?php namespace spec;

use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class RomanizeSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType('Romanize');
    }

    function it_returns_I_for_1()
    {
      $this->convert(1)->shouldReturn('I');
    }

    function it_returns_II_for_2()
    {
      $this->convert(2)->shouldReturn('II');
    }

    function it_returns_III_for_3()
    {
      $this->convert(3)->shouldReturn('III');
    }

    function it_returns_IV_for_4()
    {
      $this->convert(4)->shouldReturn('IV');
    }

    function it_returns_V_for_5()
    {
      $this->convert(5)->shouldReturn('V');
    }

    function it_returns_X_for_10()
    {
      $this->convert(10)->shouldReturn('X');
    }

    function it_returns_C_for_100()
    {
      $this->convert(100)->shouldReturn('C');
    }

    function it_returns_D_for_500()
    {
      $this->convert(500)->shouldReturn('D');
    }

    function it_returns_M_for_1000()
    {
      $this->convert(1000)->shouldReturn('M');
    }

    function it_returns_CCLXXIX_for_279()
    {
      $this->convert(279)->shouldReturn('CCLXXIX');
    }

    function it_returns_CD_for_400()
    {
      $this->convert(400)->shouldReturn('CD');
    }

    function it_returns_CM_for_900()
    {
      $this->convert(900)->shouldReturn('CM');
    }

    function it_returns_CMXIV_for_914()
    {
      $this->convert(914)->shouldReturn('CMXIV');
    }

    function it_returns_MMCMLXXIII_for_2973()
    {
      $this->convert(2973)->shouldReturn('MMCMLXXIII');
    }

}
