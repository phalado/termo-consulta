# frozen_string_literal: true

class LoadFile
  def parse
    ('a'..'z').each do |l|
      path = "lib/word_list_#{l}.txt"
      load_file(path)
    end
  end

  def load_file(path)
    file = File.open(path, 'r')
    file.each { |f| Word.new(word: f.split("\n").first).save }
  end
end
