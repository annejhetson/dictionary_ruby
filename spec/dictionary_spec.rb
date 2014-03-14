require 'rspec'
require 'dictionary'
require 'definition'

describe 'Term' do
  it 'is initialized with word and definition' do
    new_term = Term.new('gum', 'yummie')
    new_term.should be_an_instance_of Term
  end

  describe 'word' do
    it 'saves/stores/returns the word' do
      new_term = Term.new('gum', 'yummie')
      new_term.word.should eq 'gum'
    end
  end

  describe 'definition' do
    it 'saves/stores definition in to an array and returns all definitions' do
      new_term = Term.new('gum', 'yummie')
      new_term.definition.should eq 'yummie'
    end
  end
  describe 'add' do
    it 'adds and saves another definition into the array' do
      test1 = Definition.new('yummie')
      test_definition = Definition.new("chewy substance")
      new_term = Term.new('gum', test1.definition)
      test2 = Definition.new('chewy substance')
      new_term.add(test2.definition)
      new_term.definition.should eq 'yummie; chewy substance'
    end
  end
  
  describe '.all' do
    it 'starts as an empty array' do
      Term.all.should eq []
    end
  end

  describe '.create' do
    it 'adds and saves the instance to all_terms array' do
      test_term = Term.create('gum', 'yummie')
      Term.all.should eq [test_term]
    end
  end

  describe '#search' do
    it 'searches the all_terms array and returns the element whose key matches the search term' do
      test_term = Term.create('gum', 'yummie')
      Term.search('gum').should eq 'gum: yummie'
    end
  end
end

describe Definition do
  it 'is initialized with definition and a instance of Definition' do
    test_definition = Definition.new("chewy substance")
    test_definition.should be_an_instance_of Definition
    test_definition.definition.should eq 'chewy substance'
  end
end


