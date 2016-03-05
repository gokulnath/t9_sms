#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 't9_sms'

class T9SMSTest < Minitest::Test
  def test_decode_2
    assert_equal 'a', T9SMS.new('2').decode
  end

  def test_decode_22
    assert_equal 'b', T9SMS.new('22').decode
  end

  def test_decode_2_22
    assert_equal 'ab', T9SMS.new('2 22').decode
  end

  def test_decode_2022
    assert_equal 'a b', T9SMS.new('2022').decode
  end

  def test_decode_3
    assert_equal 'd', T9SMS.new('3').decode
  end

  def test_decode_33
    assert_equal 'e', T9SMS.new('33').decode
  end

  def test_decode_2223
    assert_equal 'cd', T9SMS.new('2223').decode
  end

  def test_decode_2_2202223033_333
    assert_equal 'ab cd ef', T9SMS.new('2 2202223033 333').decode
  end
end

