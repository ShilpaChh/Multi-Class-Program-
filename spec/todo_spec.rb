require "todo"

RSpec.describe Todo do

    context "when no task is there" do
        it "empty task list" do
            expect { Todo.new("") }.to raise_error "No task given."
        end
    end

    context "when one task is added" do
        it "initially ToDo list is an empty list" do
            todo_entry = Todo.new("Cook food")
            expect(todo_entry.task).to eq ("Cook food")
        end
    end

    context "once task has completed" do
        it "shows the task as complete" do
            todo_entry = Todo.new("Cook food")
            todo_entry.mark_done!
            expect(todo_entry.done?).to eq true
        end
    end

end



