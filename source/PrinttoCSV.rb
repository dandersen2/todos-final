
module PrinttoCSV

  def print_to_csv(list_array)

    output_file = File.new("todo.csv","wb")
    list_array.each_with_index do |list_item, list_item_i|
    output_file << "#{list_item_i+1}. #{list_item.task} \n"

    end
    output_file.close

  end

end

