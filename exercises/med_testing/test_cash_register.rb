require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < MiniTest::Test
  ITEM_COST = 25

  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(ITEM_COST)
    @transaction.amount_paid = ITEM_COST
  end

  def test_accept_money
    start_amount = @register.total_money
    @register.accept_money(@transaction)
    assert_equal(start_amount + ITEM_COST, @register.total_money)
  end

  def test_change
    assert_equal(0, @register.change(@transaction))
  end

  def test_give_receipt
    output = "You've paid $#{@transaction.item_cost}.\n"
    assert_output(output) { @register.give_receipt(@transaction) }
  end
end
