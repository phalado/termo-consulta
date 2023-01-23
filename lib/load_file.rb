# frozen_string_literal: true

class LoadFile
  def parse
    # ('a'..'z').each do |l|
    #   path = "lib/word_list_#{l}.txt"
    #   load_file(path)
    # end

    p 'ok'
    load_file("lib/palavras.txt")
  end

  def load_file(path)
    file = File.open(path, 'r')
    file.each do |line|
      word = line.split("\n").first
      puts word, word.length, word.length == 5
      Word.new(word: word).save if word.length == 5
    end
  end
end
