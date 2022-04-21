class Word < ApplicationRecord
  validates_presence_of :word
  validates_uniqueness_of :word
  validates :word, length: { is: 5 }

  after_save :save_letters
  before_save :check_on_word

  def save_letters
    letters = self.word.split('').map { |letter| validate_letter(letter) }

    self.letters = letters
  end

  def check_on_word
    
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
