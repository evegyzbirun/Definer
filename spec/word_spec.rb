require 'rspec'
require 'word'

describe '#Word' do
  
  before(:each) do
    Word.clear()
  end
  describe('.all') do
    it('if there is no words returns an empty array') do
      expect(Word.all).to(eq[])
    end
  end

  
end