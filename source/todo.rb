class Task
  def initialize(args)
    @completed = false
  end

  def complete?(id)
    @completed
  end

# task.complete? ==> true or false

# 1) Create well-defined classes with a single responsibility

# 2) Identify and implement classes based on real world requirements

# 3)Implement clean and flexible interfaces between objects


# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

