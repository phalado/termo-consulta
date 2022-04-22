class Word < ApplicationRecord
  validates_presence_of :word
  validates_uniqueness_of :word
  validates :word, length: { is: 5 }

  before_save :save_letters

  searchkick

  def search_data
    {
      word: word,
      l_one: l_one,
      l_two: l_two,
      l_three: l_three,
      l_four: l_four,
      l_five: l_five,
    }
  end

  def save_letters
    letters = self.word.split('').map { |letter| validate_letter(letter) }

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

  def self.fetch(l_one, l_two, l_three, l_four, l_five)
    search_filters = {}

    search_filters.merge!({ l_one: l_one }) unless l_one.nil?
    search_filters.merge!({ l_two: l_two }) unless l_two.nil?
    search_filters.merge!({ l_three: l_three }) unless l_three.nil?
    search_filters.merge!({ l_four: l_four }) unless l_four.nil?
    search_filters.merge!({ l_five: l_five }) unless l_five.nil?

    Word.search '*', where: search_filters
  end

  private

  def validate_letter(letter)
    case letter
    when 'á', 'à', 'ã', 'â',  'ä'
      return 'a'
    when 'é', 'è', 'ẽ', 'ê', 'ë'
      return 'e'
    when 'í', 'ì', 'ĩ', 'î', 'ï'
      return 'i'
    when 'ó', 'ò', 'õ', 'ô', 'ö'
      return 'o'
    when 'ú', 'ù', 'ũ', 'û', 'ü'
      return 'u'
    when 'ç'
      return 'c'
    when 'ñ'
      return 'n'
    else
      return letter
    end
  end
end
