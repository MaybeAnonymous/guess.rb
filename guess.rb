#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rainbow'

class Config
  attr_reader :min, :max, :tries

  def initialize
    @min = 0
    @max = 100
    @tries = 8
  end
end

config = Config.new
number = rand(config.min..config.max)

# Uncomment this line to get the answer
# puts number

puts "Welcome! Guess a number between #{config.min} and #{config.max}. You have #{config.tries} tries."

config.tries.times do
  begin
    print Rainbow('Your guess: ').yellow
    guess = gets.chomp.to_i
  rescue SystemExit, Interrupt
    puts "\nGoodbye!"
    exit
  end
  if guess == number
    puts 'You win!'
    exit
  elsif guess > number
    puts 'Too big, try a lower guess.'
  elsif guess < number
    puts 'Too small, try a higher guess.'
  end
end
puts "You lose! It was #{number}"
