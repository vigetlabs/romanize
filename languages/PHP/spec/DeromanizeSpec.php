<?php namespace spec;

use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class DeromanizeSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType('Deromanize');
    }

    function it_returns_1_for_I()
    {
      $this->convert('I')->shouldReturn(1);
    }

    function it_returns_2_for_II()
    {
      $this->convert('II')->shouldReturn(2);
    }

    function it_returns_3_for_III()
    {
      $this->convert('III')->shouldReturn(3);
    }

    function it_returns_4_for_IV()
    {
      $this->convert('IV')->shouldReturn(4);
    }

    function it_returns_5_for_V()
    {
      $this->convert('V')->shouldReturn(5);
    }

    function it_returns_10_for_X()
    {
      $this->convert('X')->shouldReturn(10);
    }

    function it_returns_100_for_C()
    {
      $this->convert('C')->shouldReturn(100);
    }

    function it_returns_500_for_D()
    {
      $this->convert('D')->shouldReturn(500);
    }

    function it_returns_1000_for_M()
    {
      $this->convert('M')->shouldReturn(1000);
    }

    function it_returns_279_for_CCLXXIX()
    {
      $this->convert('CCLXXIX')->shouldReturn(279);
    }

    function it_returns_400_for_CD()
    {
      $this->convert('CD')->shouldReturn(400);
    }

    function it_returns_900_for_CM()
    {
      $this->convert('CM')->shouldReturn(900);
    }

    function it_returns_914_for_CMXIV()
    {
      $this->convert('CMXIV')->shouldReturn(914);
    }

    function it_returns_2973_for_MMCMLXXIII()
    {
      $this->convert('MMCMLXXIII')->shouldReturn(2973);
    }

}
