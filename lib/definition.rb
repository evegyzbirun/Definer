class Definition
  attr_reader :id
  attr_accessor :name, :word_input_id

  @@definitions = {}
  @@total_def = 0

  def initialize(name, word_input_id, id)
    @name = name
    @word_input_id = word_input_id
    @id = id || @@total_def += 1
  end

  def ==(compare)
    self.name() == compare.name() && self.word_input_id() == compare.word_input_id()
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.name, self.word_input_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(name, word_input_id)
    self.name = name
    self.word_input_id = word_input_id
    @@definitions[self.id] = Definition.new(self.name, self.word_input_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find_by_word(wr_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_input_id == wr_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def word
   Word.find(self.word_input_id)
  end
end