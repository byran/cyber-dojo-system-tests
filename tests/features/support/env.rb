require 'minitest/spec'

class MinitestWorld
  include Minitest::Assertions
  attr_accessor :assertions

  def initialize
    self.assertions = 0

    @context = {}
  end
end

World do
  MinitestWorld.new
end

