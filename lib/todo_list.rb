class TodoList

    def initialize
         @todo_list = []
    end
  
    def add(todo) # todo is an instance of Todo
      @todo_list << todo
    end
  
    def incomplete  # Returns all non-done todos
        incomplete_tasks = @todo_list.select do |complete| !complete.done?
        end
        return incomplete_tasks
    end
  
    def complete  # Returns all complete todos
        completed_tasks = @todo_list.select do |complete| complete.done?
      end
      return completed_tasks
    end
  
    def give_up!    # Marks all todo's as complete
        tasks = @todo_list.each do |complete| complete.mark_done!
      end
      return tasks
    end

  end

  
# # File: lib/todo_list.rb
# class TodoList
#     def initialize
#     end
  
#     def add(todo) # todo is an instance of Todo
#       # Returns nothing
#     end
  
#     def incomplete
#       # Returns all non-done todos
#     end
  
#     def complete
#       # Returns all complete todos
#     end
  
#     def give_up!
#       # Marks all todos as complete
#     end
#   end
  