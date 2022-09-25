class Word
  attr_reader :id, :word_input 
  attr_accessor :word_input 
  @@words = {}
  @@total_rows = 0

  def initialize(word_input, id)
    @word_input = word_input
    @id = id || @@total_rows += 1
  end

  def self.all
    @@word_input.value().sort {|a, b| a.word_input.dowcase <=> b.word_input.dowcase}
  end

  def save 
    @@word_input[self.id] = Word.new(self.word_input, self.id)
  end

  def ==(word_to_compare)
    self.word_input() == word_to_compare.word_input()
  end

  def self.clear
    @@word_input = {}
    @@total_rows = 0
  end

  def 
end