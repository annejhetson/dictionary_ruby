require './lib/dictionary'

@name = ''

def main_menu
  puts "Welcome to the Word Repository. What is your name?\n\n"
  @name = gets.capitalize.chomp
  puts "\n\nHow may we help you, #{@name}?\n\n"
  top_menu
end

def top_menu
  puts "To create a new Term, please press 'T'."
  puts "To see all terms, please press 'A'."
  puts "To find a specific word or definition, please press 'F'."
  puts "To exit, please press 'X'.\n\n"
  entry = gets.chomp
  case entry
  when 't', 'T'
    enter_term
  when 'A', 'a'
    see_term
  when 'f', 'F'
    search_menu
  when 'x', 'X'
    puts "d(^o^)b¸¸Good-bye..♬·¯·♩¸¸♪·¯·♫¸¸\n\n"
  else
    top_menu
  end
end

def enter_term
  puts "What is the word you would like to enter?\n"
  word = gets.chomp
  puts "What is the definition of #{word}?\n"
  definition = gets.chomp
  puts "Great! We have added #{word} with the definition of '#{definition}'.\n\n"
  new_term = Term.create(word, definition)

  add_definition(new_term, word)
end

def add_definition(new_term, word)
  puts "To enter another definition, press 'N'"
  puts "To return to the main menu, press 'M'\n"
  entry = gets.downcase.chomp
  case entry 
    when 'm'
    top_menu   
    when 'n'
    puts "Enter another definition for #{word}:\n"
    new_definition = gets.chomp
    new_term.add(new_definition)
    
    add_definition(new_term, word)
  end
end

def see_term
  puts "#{@name}, here is a list of all the terms. \n"
  puts "---------------------------------------------------- \n"
  Term.all.each_with_index do |term, index|
    puts "#{index+1}. #{term.word} - #{term.definition}"
    end
  puts "---------------------------------------------------- \n\n"
  edit_option
end

def edit_option
  puts "To edit a term, please press 'E'.
        To add another term, please press 'T'.
        To delete a term, please press 'D'.
        To exit, please press 'X'
        Press any key to be taken to the previous menu.\n\n"
  entry = gets.chomp
  case entry
  when 'e', 'E'
    edit_menu
  when 't', 'T'
    enter_term
  when 'd', 'D'
    delete_menu
  when 'x', 'X'
    puts "d(^o^)b¸¸Good-bye..♬·¯·♩¸¸♪·¯·♫¸¸\n\n"
  else
    top_menu
  end
end

def edit_menu
  puts "Oh no! Did we make a mistake? Please choose the number of the entry you would like to edit!\n\n"
  puts "---------------------------------------------------- \n"
  Term.all.each_with_index do |term, index|
    puts "#{index+1}. #{term.word} - #{term.definition}"
    end
  puts "---------------------------------------------------- \n\n"
  entry = gets.chomp.to_i 
  puts "\n\nWould you like to edit the word '#{Term.all[entry-1].word}'? Press 'W'.\n"
  puts "Or would you like to edit the definition, '#{Term.all[entry-1].definition}'? Press 'D'.\n"
  puts "---------------------------------------------------- \n"
  entry2 = gets.chomp
  case entry2
  when 'w', 'W'
    puts "Please enter the edited word. Please remember this *replaces* the previous word."
    user_word = gets.chomp
    Term.all[entry-1].word.replace(user_word)
    puts Term.all[entry-1].word
    see_term
  when 'd', 'D'
    puts "Please enter the edited definition. Please remember this *replaces* the previous definition."
    user_definition = gets.chomp
    Term.all[entry-1].definition.replace(user_definition)
    puts Term.all[entry-1].definition
    see_term
  end
end

def delete_menu
  puts "Oh no! We're sad to see words go! To delete a word, please choose the number of the entry you would like to delete!\n"
  Term.all.each_with_index do |term, index|
    puts "#{index+1}. #{term.word}"
  end
  entry = gets.chomp.to_i
  Term.all.delete_at(entry-1)
  see_term
end

def search_menu
  puts "What word would you like to find the definition of?"
  search_term = gets.chomp
  result = Term.search(search_term)
  puts "\n\n Searching! ¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>\n\n"
  if result == nil
    puts "\n\n٩(͡๏̯͡๏)۶\n\n"
    puts "Sorry, we didn't find that word in this repository. How about entering it?\n\n"
    top_menu
  else 
    puts result "\n\n"
    top_menu
  end




  # Term.all.each do |key|
  #   if key.word == search_term
  #     puts "\n\n Searching! ¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>\n\n"
  #     puts key.word + ": " + key.definition
  #     top_menu
  #   elsif key.word != search_term
  #     puts "\n\n٩(͡๏̯͡๏)۶\n\n"
  #     puts "Sorry, we didn't find that word in this repository. How about entering it?\n\n"
  #     enter_term
  #   end
  # end
end


main_menu
