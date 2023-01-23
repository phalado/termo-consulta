# frozen_string_literal: true

class LoadFile
  def parse
    # ('a'..'z').each do |l|
    #   path = "lib/word_list_#{l}.txt"
    #   load_file(path)
    # end

    load_file("lib/palavras.txt")
  end

  def load_file(path)
    file = File.open(path, 'r')
    file.each do |line|
      Word.new(word: line.split("\n").first).save if line.length == 5
    end
  end
end
