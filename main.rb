run = true
$names_list = []

def new_list
  puts "\nWhat will the name of the list be?"
  name = gets.chomp
  $names_list.push(name)  
  instance_variable_set("@#{name}", [])
  return puts "The #{name} list was created"
end

def view_lists
  puts "\nThe List are:"
  puts $names_list
end

def new_item(list,name)
    puts "\nWhat will the name of the item be?"
    item= gets.chomp
    list.push(item)
    puts "#{item} was added to #{name} list"
end

def edit_list
    puts "\nWhat list do you want to edit or view"
    e_name = gets.chomp
    if $names_list.include?(e_name) 
      puts instance_variable_get("@#{e_name}").empty? ? "The #{e_name} list is empty" : "#{e_name} list: #{instance_variable_get("@#{e_name}")}"
      puts "\nWhat do you want to do?"
      puts "Type 'add' if you want to add an item to the list"
      puts "Type 'return' if you want return"
      op = gets.chomp
      case op
      when "add" then new_item(instance_variable_get("@#{e_name}"),e_name)
      when "return" then nil
      else "Wrong action" 
      end
    else
      puts "#{e_name} doesn't exist"
    end
end

while run
  puts "\nWhat do you want to do"
  puts "Type 'new' if you want to create a new to-do list"
  puts "Type 'view' if you want to view the list"
  puts "Type 'edit' if you want to see or edit an specific list"
  puts "Type 'exit' if you want to exit"
  action = gets.chomp.downcase
  
  case action
    when "new" then new_list
    when "view" then view_lists
    when "edit" 
      edit_list
    when "exit" then run = false
    else
      puts "Wrong action"    
  end
end 
