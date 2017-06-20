# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_item)
    raise TypeError, "Can only add Todo objects" unless todo_item.instance_of? Todo
    @todos.push(todo_item)
    @todos
  end
  alias_method :<<, :add

  def all_done
    select { |item| item.done? }
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def done?
    @todos.all? { |item| item.done? }
  end

  def done!
    @todos.each_index { |index| mark_done_at(index) }
  end

  def each
    @todos.each { |item| yield(item) }
    self
  end

  def find_by_title(title)
    select { |item| item.title == title }.first
  end

  def first
    @todos[0]
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def last
    @todos[-1]
  end

  def mark_all_done
    each { |item| item.done! }
  end

  def mark_all_undone
    each { |item| item.undone! }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def select
    new_list = TodoList.new(title)
    each { |item| new_list << item if yield(item) }
    new_list
  end

  def shift
    @todos.shift
  end

  def size
    @todos.size
  end

  def to_a
    @todos
  end

  def to_s
    string = "---- #{title} ----\n"
    @todos.each do |item|
      string += "#{item}\n"
    end

    string
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list << todo3

puts list

list.mark_all_done

puts list

list.mark_all_undone

puts list
