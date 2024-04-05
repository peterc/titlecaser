# frozen_string_literal: true

require_relative "titlecaser/version"

module Titlecaser  
  class TitleCase
    def initialize(string)
      @string = string
    end
  
    def convert
      words = @string.split(' ')
      previous_word = nil
      converted_words = words.map.with_index do |word, index|
        # Take any initial punctuation character (e.g. quotes) and store it to rejoin later
        starting_punctuation = word[/\A[^\p{L}0-9]/].to_s

        # Take the rest of the word
        word = word[starting_punctuation.length..-1]

        # If it's already capitalized and NOT a minor word, leave everything as-is
        if already_capitalized?(word) && !minor_word?(word)
          word = starting_punctuation + word
        else
          # Otherwise, determine if it's a major word and handle appropriately
          if major_word?(word, index, previous_word)
            word = starting_punctuation + capitalize_word(word)
          else
            # Force a downcase if need be
            word = starting_punctuation + word.downcase
          end
        end

        # Store the word for the next iteration, as it may have useful trailing punctuation
        previous_word = word
      end

      # Put it all back together
      converted_words.join(' ')
    end
  
    private
  
    def already_capitalized?(word)
      word[0] == word[0].upcase
    end
  
    def major_word?(word, index, previous_word)
      return true if index.zero? || word.length > 4

      # Also return true if the word follows a colon,
      # full stop, or question mark, ignoring any whitespace,
      # as these essentially 'restart' the sentence.
      # e.g. "blah: blah" should become "Blah: Blah"
      return true if previous_word && previous_word.match?(/[:.?!]\z/)
  
      !minor_word?(word)
    end
  
    def minor_word?(word)
      %w[and as but for if nor or so yet a an the at by for in is of off on per to up via with].include?(word.downcase)
    end
  
    def capitalize_word(word)
      word.capitalize
    end
  end

  def self.titlecase(string)
    TitleCase.new(string).convert
  end
end
