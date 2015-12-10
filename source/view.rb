class View

  def get_input
    gets.chomp
  end

  def show_output(output)
    puts output
  end

  def display_to_do_list
    puts "Here's your to-do list:"
  end

  def display_add_task
    puts "Describe your task:"
  end

  def display_update_task
    puts "Type the number of the task you completed"
  end

  def display_delete_task
    puts "Type the number of the task want to delete"
  end

  def display_welcome_message
    puts "Welcome to To-Do List! To view your list:
      type list, to add a new item: type add,
      to update the status of a current item: type update,
      to delete an item: type Delete, to exit the program: type exit"
  end

end
