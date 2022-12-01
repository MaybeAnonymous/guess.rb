#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rainbow'
require 'optparse'

options = { cheat: false, min: 0, max: 100, tries: 8 }

# Command-line option parser
OptionParser.new do |option|
  option.banner = 'Usage: guess.rb [options]'

  option.on('-h', '--help', 'Show this help screen') do
    puts option
    exit
  end

  option.on('-c', '--cheat', 'Show the generated number before the game starts') do
    options[:cheat] = true
  end

  option.on('--min MIN', 'Minimum value for the generated number') do |min|
    options[:min] = min.to_i
  end

  option.on('--max MAX', 'Maximum value for the generated number') do |max|
    options[:max] = max.to_i
  end

  option.on('-t TRIES', '--tries TRIES', 'Number of tries') do |tries|
    options[:tries] = tries.to_i
  end
end.parse!

class Config
  attr_reader :min, :max, :tries

  def initialize(options)
    @min = options[:min]
    @max = options[:max]
    @tries = options[:tries]
  end
end

config = Config.new(options)
number = rand(config.min..config.max)

puts number if options[:cheat]

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
