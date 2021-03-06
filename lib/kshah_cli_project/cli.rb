require 'colorize'
class KshahCliProject::Cli
  
  def greeting
    sleep 1
    puts "*****The Lipstick Reader Welcomes You*****".colorize(:light_red)
    sleep 1
    puts "Loading Menu...beauty takes time!".colorize(:light_red)
    KshahCliProject::API.get_response_body
    menu
  end
  
  def menu
    input = ''
    while input != 'Exit' 
    puts "*To search by brand, enter 'brand'.".colorize(:light_cyan)
    puts "*To have the Lipstick Reader select one for you, enter 'surprise me'.".colorize(:light_cyan)
    puts "*For a vegan selection, enter 'vegan'.".colorize(:light_magenta)
    puts "*For an all natural selection, enter 'natural'.".colorize(:light_magenta)
    puts "*For a peanut free product selection, enter 'peanut free product'.".colorize(:light_magenta)
    puts "*For a gluten free selection, enter 'gluten free'.".colorize(:light_magenta)
    puts "*For an organic selection, enter 'organic'.".colorize(:light_magenta)
    puts "*For a chemical free selection, enter 'chemical free'.".colorize(:light_magenta)
    puts "~~~To exit, enter 'exit'.~~~".colorize(:light_yellow)
    input = gets.strip.split(" ").collect {|x| x.capitalize}.join(" ")
      if input == "Surprise Me" 
        Lipstick.all.sample.print_info
      elsif input == 'Exit'
        puts "*****Thank you for visiting the Lipstick Reader*****".colorize(:light_red)
      elsif input == 'Brand'
        Lipstick.get_all_brands.each_with_index {|b,i| puts "#{i+1}. #{b}"}
        puts "*Please enter the number of the brand for more information:".colorize(:red)
        number = gets.chomp.to_i 
        Lipstick.search_brands(number)
      else
        Lipstick.find_by_name(input)
      end
    end 
  end
end 

  
