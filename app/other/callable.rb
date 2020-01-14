# frozen_string_literal: true

# Simple callable interface that allows
# call objects through static class method

class Callable
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
