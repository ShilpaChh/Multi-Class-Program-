require "todo"
require "todo_list"

RSpec.describe "ToDo Integration tests" do

    context "after adding one entry" do
        it "lists the tasks added but not yet completed" do
            todo_list = TodoList.new
            todo_entry = Todo.new("Cook food")
            todo_list.add(todo_entry)
            expect(todo_list.incomplete).to eq [todo_entry]
        end
    end

    context "completed Tasks" do
        it "lists the tasks that have completed" do
            todo_list = TodoList.new
            todo_entry = Todo.new("Cook food")
            todo_list.add(todo_entry)
            todo_entry.mark_done!
            expect(todo_list.complete).to eq [todo_entry]
        end
    end

    context "after adding multiple ToDO entries" do
        it "lists the tasks added which are still pending" do
            todo_list = TodoList.new
            todo_entry = Todo.new("Cook food")
            todo_entry1 = Todo.new("Clean kitchen")
            todo_entry2 = Todo.new("Teach Meghna")
            todo_list.add(todo_entry)
            todo_list.add(todo_entry1)
            todo_list.add(todo_entry2)
            expect(todo_list.incomplete).to eq [todo_entry, todo_entry1, todo_entry2]
        end
    end

    context "lists all completed tasks" do
        it "lists the tasks added and completed" do
            todo_list = TodoList.new
            todo_entry = Todo.new("Cook food")
            todo_entry1 = Todo.new("Clean kitchen")
            todo_entry2 = Todo.new("Teach Meghna")
            todo_list.add(todo_entry)
            todo_list.add(todo_entry1)
            todo_list.add(todo_entry2)
            todo_entry.mark_done!
            expect(todo_list.complete).to eq [todo_entry]
        end
    end

    context "when no task is there" do
        it "empty task list" do
            todo_list = TodoList.new
            todo_entry = Todo.new("Cook food")
            expect { Todo.new("") }.to raise_error 'No task given.'
        end
    end

    context "give up" do
        it "Marks all todo's as complete" do
            todo_list = TodoList.new
            todo_entry = Todo.new("Cook food")
            todo_entry1 = Todo.new("Clean kitchen")
            todo_entry2 = Todo.new("Teach Meghna")
            todo_list.add(todo_entry)
            todo_list.add(todo_entry1)
            todo_list.add(todo_entry2)
            todo_list.give_up!
            expect(todo_entry.done?).to eq true
        end
    end

end