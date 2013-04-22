class CashSlot
  attr_reader :contents

  def initialize
    @contents = 0
  end

  def dispense(amount)
    @contents = amount
  end

  def clear
    @contents = 0
  end
end
