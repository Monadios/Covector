# -*- coding: utf-8 -*-
keyboard = [
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "å"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l", "æ", "ø", "'"],
            ["z", "x", "c", "v", "b", "n", "m", ",", ".", "-"],
           ]


class Keyboard
  attr_reader :keyboard

  def initialize(keyboard)
    @keyboard = from_array(keyboard)
  end

  def at(index)
    raise IndexError.new("#{index} is not a valid index") unless index.is_a? Index
    return @keyboard[index.row][index.column]
  end

  def string_index(string)
    string.chars.map {|c| find_index(c)}
  end

  def find_index(key)
    index = nil
    @keyboard.each_with_index do |row, i|
      val = row.select {|k| key == k.value}[0]
      if !val.nil?
        return Index.new(i, row.find_index(val))
      end
      return index
    end

    if index.nil?
      raise IndexError.new "#{key} does not exist in keyboard"
    end
  end

  def from_array(keys)
    return keys.map do |row|
      row.map do |k|
        Key.new(k)
      end
    end
  end

  private_methods :from_array
end

class Index
  attr_accessor :column, :row

  def initialize(column, row)
    @column = column
    @row = row
  end

  def minus(index)
    Math.sqrt((index.column - @column)^2 + (index.row - @row)^2)
  end
end

class Key
  attr_accessor :value

  def initialize(key)
    if is_valid?(key)
      @value = key
    else
      raise ValueError.new("#{key} is not a valid key value")
    end
  end

  def is_valid?(key)
    #return key.length == 1
    #decide what a valid key is later
    true
  end

  def -(key)
   
  end

  def to_s
    @value
  end

  private_methods :is_valid?
end
