require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    first = @list.shift
    assert_equal(@todo1, first)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    last = @list.pop
    assert_equal(@todo3, last)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_add_TypeError
    assert_raises(TypeError) { @list.add("Something") }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel_operator_as_add_alias
    todo = Todo.new("Do dishes")
    @list << todo
    @todos << todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo = Todo.new("Do dishes")
    @list.add(todo)
    @todos.push(todo)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(5) }
    assert_equal(@todo3, @list.item_at(-1))
    assert_raises(IndexError) { @list.item_at(-5) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_raises(IndexError) { @list.mark_done_at(5) }
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(5) }
    @todo1.done!
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
  end

  def test_done_exclamation
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(5) }
    item = @list.remove_at(0)
    assert_equal(@todo1, item)
    assert_equal(2, @list.size)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
  output = <<-OUTPUT
---- Today's Todos ----
[ ] Buy milk
[ ] Clean room
[ ] Go to gym
OUTPUT

  assert_equal(output, @list.to_s)
  end

  def test_to_s_when_one_is_done
  output = <<-OUTPUT
---- Today's Todos ----
[ ] Buy milk
[X] Clean room
[ ] Go to gym
OUTPUT
  @list.mark_done_at(1)
  assert_equal(output, @list.to_s)
  end

  def test_to_s_when_all_done
    output = <<-OUTPUT
---- Today's Todos ----
[X] Buy milk
[X] Clean room
[X] Go to gym
  OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    array = []
    @list.each do |item|
      array << item
    end

    assert_equal(@list.to_a, array)
  end

  def test_each_returns_original_object
    object = @list.each { |item| "do nothing" }
    assert_equal(@list, object)
  end

  def test_select
    todo_list = @list.select { |item| !item.done? }
    assert_equal(@list.to_s, todo_list.to_s)
  end

  def test_all_done
    result = @list.all_done
    assert_equal(TodoList.new("Today's Todos").to_s, result.to_s)
  end

  def test_all_not_done
    result = @list.all_not_done
    assert_equal(@list.to_s, result.to_s)
  end

  def test_find_by_title
    item = @list.find_by_title("Buy milk")
    assert_equal(@todo1, item)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
end
