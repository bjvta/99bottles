# frozen_string_literal: true

# lib/bottles.rb
class Bottles
  def song
    verses(99, 0)
  end

  def verses(from, to)
    verses = ''
    while from >= to
      extraline = from == to ? '' : "\n"
      verses += verse(from) + extraline
      from -= 1
    end
    verses
  end

  def verse(number)
    previous_number = number - 1
    previous_number = 99 if previous_number == -1
    <<~VERSE
      #{bottles(number, true)} of beer on the wall, #{bottles(number)} of beer.
      #{second_verse(number)}, #{bottles(previous_number)} of beer on the wall.
    VERSE
  end

  def bottles(number, initial: false)
    if number > 1
      "#{number} bottles"
    elsif number == 1
      "#{number} bottle"
    else
      initial ? 'No more bottles' : 'no more bottles'
    end
  end

  def take_beer(number)
    return 'Take it' if number == 1

    'Take one'
  end

  def second_verse(number)
    return 'Go to the store and buy some more' if number.zero?

    "#{take_beer(number)} down and pass it around"
  end
end
