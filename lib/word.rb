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
     @@words.values().sort { |a, b| a.word_input.downcase <=> b.word_input.downcase }
   end

  def save 
    @@words[self.id] = Word.new(self.word_input, self.id)
  end

  def ==(word_to_compare)
    self.word_input() == word_to_compare.word_input()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update(word_input)
    self.word_input = word_input
    @@words[self.id] = Word.new(self.word_input, self.id)
  end

  def delete()
    @@words.delete(self.id)
  end


end