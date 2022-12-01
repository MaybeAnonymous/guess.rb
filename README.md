# guess.rb

A number guessing game written in Ruby, inspired by [this](https://doc.rust-lang.org/book/ch02-00-guessing-game-tutorial.html) Rust game.

## Dependencies

### [ruby](https://www.ruby-lang.org/en/)

* Installation depends on your system, please check the website.

### [rainbow](https://rubygems.org/gems/rainbow)
	
* Gem used for coloring terminal text.
* `gem install rainbow`

### [optparse](https://rubygems.org/gems/optparse)

* Gem used to parse command-line arguments.
* `gem install optparse`

## Usage

```
Usage: guess.rb [options]
    -h, --help                       Show this help screen
    -c, --cheat                      Show the generated number before the game starts
        --min MIN                    Minimum value for the generated number
        --max MAX                    Maximum value for the generated number
    -t, --tries TRIES                Minimun value for the generated number
```

