class LoadFile
  def initialize(file)
    p file
    file.each {|line| p line}
    @file = file
    p @file
  end

  def parse
    @file.each do |line|
      Word.create!(word: line)
    end
  end
end
