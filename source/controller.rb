require_relative 'todo_file_parser'
require_relative 'view'

class Controller

  attr_accessor :list

  def initialize(list, view)
    @list = list
    @view = view
  end

  def user_action
    case ARGV[0]
    when "list"
      generate_todo_list
    when "add"
      @view.add_item(ARGV[1..-1].join(" "))
      add_todo_item
      generate_todo_list
    when "delete"
      index = (ARGV[1].to_i - 1)
      @view.delete_item(@list.todo_list_array[index][0])
      delete_todo_item
      generate_todo_list
    else
      @view.no_input
    end
  end

  def generate_todo_list
    @list.generate_task.each_with_index{|task, index| @view.display_list(task.join(" "), index + 1)}
  end

  def add_todo_item
    CSV.open('todo.csv', 'a') {|csv| csv << ARGV[1..-1]}
  end

  def delete_todo_item
    index = (ARGV[1].to_i - 1)
    array = @list.todo_list_array - @list.todo_list_array.delete_at(index)
    CSV.open('todo.csv', 'w') {|csv| array.each {|task| csv << task}}
  end

end
