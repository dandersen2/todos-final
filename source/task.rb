# I AM ONE OF JACK's DIGITS. HE NEEDS ME. MANY OF ME MAKE A HAND.

class Task
  attr_reader :task_id, :task_content
  attr_accessor :completed

  def initialize(args)
    self.completed  = false
    @task_content = args
    @task_id = rand.to_s[2..6].to_i
  end

  # def completed(task_id)
  # end

  def completed?(task_id)
    @completed
  end

end

# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (CONTROLLER)

# 2. Displaying information to the user (VIEWER)

# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")

# 4. Manipulating the in-memory objects that model a real-life TODO list (MODEL)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).


# how to access the attributes of Task objects withing a TaskList object!:
# _______________________________________________________________________
# [2] pry(#<Controller>)> x = my_todo_list
# [9] pry(#<Controller>)> x.list.class
# => Array
# [10] pry(#<Controller>)> x.list[0]
# => #<Task:0x007f8cb3bcc6a8 @completed=false, @task_content="I am Jacks food he uses my nutrients as building blocks for his parts", @task_id=30862>
# [11] pry(#<Controller>)> x.list[0].completed
# => false
# [12] pry(#<Controller>)> x.list[0].task_content
# => "I am Jacks food he uses my nutrients as building blocks for his parts"
# [13] pry(#<Controller>)> x.list[0].task_id
# => 30862
