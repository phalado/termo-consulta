# frozen_string_literal: true

class Word < ApplicationRecord
  validates_presence_of :word
  validates_uniqueness_of :word
  validates :word, length: { is: 5 }

  before_save :save_letters

  searchkick

  def search_data
    {
      word: word,
      letters: letters,
      l_one: l_one,
      l_two: l_two,
      l_three: l_three,
      l_four: l_four,
      l_five: l_five
    }
  end

  def save_letters
    letters = word.chars.map { |letter| validate_letter(letter.downcase) }

    self.letters = letters
  end

  def l_one
    letters[0]
  end

  def l_two
    letters[1]
  end

  def l_three
    letters[2]
  end

  def l_four
    letters[3]
  end

  def l_five
    letters[4]
  end

  def self.fetch(search_letters, remove_letters, l_one, l_two, l_three, l_four, l_five)
    search_filters = {}

    search_filters.merge!({ letters: { all: search_letters } }) unless search_letters.empty?
    search_filters.merge!({ _not: { letters: remove_letters } }) unless remove_letters.empty?

    search_filters.merge!({ l_one: l_one }) unless l_one.nil? || l_one.empty?
    search_filters.merge!({ l_two: l_two }) unless l_two.nil? || l_two.empty?
    search_filters.merge!({ l_three: l_three }) unless l_three.nil? || l_three.empty?
    search_filters.merge!({ l_four: l_four }) unless l_four.nil? || l_four.empty?
    search_filters.merge!({ l_five: l_five }) unless l_five.nil? || l_five.empty?

    Word.search '*', where: search_filters, order: { word: :asc }
  end

  private

  def validate_letter(letter)
    case letter
    when 'á', 'à', 'ã', 'â', 'ä'
      'a'
    when 'é', 'è', 'ẽ', 'ê', 'ë'
      'e'
    when 'í', 'ì', 'ĩ', 'î', 'ï'
      'i'
    when 'ó', 'ò', 'õ', 'ô', 'ö'
      'o'
    when 'ú', 'ù', 'ũ', 'û', 'ü'
      'u'
    when 'ç'
      'c'
    when 'ñ'
      'n'
    else
      letter
    end
  end
end
