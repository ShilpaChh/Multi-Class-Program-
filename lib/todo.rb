class Todo
    
    def initialize(task)
        fail "No task given." if task.empty?
         @task = task
         @complete = false
    end
  
    def task
        return @task.to_s
    end
  
    def mark_done!
        @complete = true
    end
  
    def done?
      if @complete == true
        return true
      else 
        return false
      end
    end

end


    # # File: lib/todo.rb
    # class Todo
    #     def initialize(task) # task is a string
    #       # ...
    #     end
      
    #     def task
    #       # Returns the task as a string
    #     end
      
    #     def mark_done!
    #       # Marks the todo as done
    #       # Returns nothing
    #     end
      
    #     def done?
    #       # Returns true if the task is done
    #       # Otherwise, false
    #     end
    #   end
    