# What classes do you need?
# 1. Gathering user input and taking the appropriate action (controller)
# Class Controller
# 2. Displaying information to the user (view)
# Class View
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# "Doable" module
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)
# Class List ( encapsulates class Task)


#responsibilities:
# Initialize an empty TODO list list = List.new
# Add a task to a TODO list list.add(Task.new("walk the dog"))
# Get all the tasks on a TODO list  tasks = list.tasks
# Delete a particular task from a TODO list tasks =  list.delete
# Complete a particular task on a TODO list tasks = task.complete
# Parse the command-line arguments and take the appropriate action  ???
# Parse the todo.csv file and wrap each entry in easier-to-manipulate Ruby objects  ???

require 'csv'
require 'pry'

module CSVParsable
 def get_tasks_from_csv(file)
    tasks = []
    CSV.foreach(file) do |row|
    tasks << Task.new(row[0])
    end
    tasks
  end
end

class List
  attr_reader  :file
  attr_accessor  :tasks
  include CSVParsable

  def initialize
    @file = "todo.csv"
    @tasks = get_tasks_from_csv(@file)
  end

  def add(task)
    @tasks << task
    save_tasks_to_csv
  end

  def save_tasks_to_csv
   CSV.open("todo.csv", "w") do |csv|
    @tasks.map {|task| csv << [task.name]}
   end
 end


  def to_s
   @tasks.map.with_index {|task, index| "#{index+1}[#{completion_status(task)}] + #{task.name}"}.join("\n")
   end


  def completion_status(task)
      if task.complete
        return "X"
      else
        return " "
      end
  end


  def delete(index)
    @tasks.delete_at((index.to_i)-1)
    save_tasks_to_csv
  end

end

class Task
  attr_accessor  :name, :complete

  def initialize(name)
    @name = name
    @complete = false
  end

  def completed
    @complete = true
  end


end

class Controller
  attr_reader  :list

  def initialize
    @list = List.new
    @view = View.new
    run
  end

  def run_interface
    if ARGV[0] == "list"
       @view.show(@list)

    elsif ARGV[0] == 'add'
       @list.add(Task.new(ARGV[1..-1].join(" ")))
       @view.show(@list)

    elsif ARGV[0] == 'delete'
       @list.delete(ARGV[1])
       @view.show(@list)

    elsif ARGV[0] == 'completed'
       @list.tasks[(ARGV[1].to_i)-1].completed
       @view.show(@list)
    end
  end

end

class View

  def show(list)
    puts list
  end
end


controller = Controller.new
list = List.new


