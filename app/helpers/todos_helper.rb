module TodosHelper
  
  def priority_column(todo)
    "#{todo.priority}!!"
  end
end
