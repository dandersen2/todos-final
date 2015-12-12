# 2. Displaying information to the user (view)
class View

  def display(output)
    puts output
  end

  def display_list(task_objects)
    puts "Here is your current to do list:"
    task_objects.each_with_index do |task, index|
      if index < 9
        puts "#{index + 1}.  #{task.completed?} #{task.content}"
      else
        puts "#{index + 1}. #{task.completed?} #{task.content}"
      end
    end
    puts
  end

  def get_user_input
    input = gets.chomp.split(" ")
    parsed_input = {command: input.shift, task_item: input.join(" ")}
    puts "You have entered: #{parsed_input[:command]} #{parsed_input[:task_item]}"
    parsed_input
  end

  def start_menu
    display("Welcome to To-Doodler!
      Enter 'list' to see your current To-Do list
      Enter 'add' followed by the To-Do item, to add a new To-Do to your list.
      Enter 'delete' followed by the To-Do item to delete a To-Do from your list.
      Enter 'completed' followed by the To-Do item to check off a To-Do on your list.")
  end

end
