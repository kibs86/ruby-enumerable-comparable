# frozen_string_literal: true

# defining SteppedRange class
class SteppedRange
  include Enumerable
  attr_reader :start, :fin, :step

  def initialize(start, fin, step)
    @start = start
    @fin = fin
    @step = step
  end

  # yield calls the block. The while loop will run and each time print out the
  # value of current
  def each
    current = start
    while current < fin
      yield current
      current += step
    end
    # the call to each returns the object
    self
  end
end
