class Term

  @@all_terms = []

  def initialize(word, definition)
    @word = word
    @definition = []
    @definition << definition
  end
  
  def add(definition)
    @definition << definition
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def word
    @word
  end
  
  def definition
    @definition.join('; ')
   end

  def Term.all
    @@all_terms
  end

  def save
    @@all_terms << self
  end

  def Term.search(searchword)
      Term.all.each do |term|
      if term.word == searchword
        return term.word + ": " + term.definition
     # elsif term.definition == searchword
      #  return term.word + ": " + term.definition
      end
    end
  end
 end

