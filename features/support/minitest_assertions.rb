require 'minitest/spec'

module CyberDojo
  class MinitestAssertions
    include Minitest::Assertions
    attr_accessor :assertions

    def initialize
      self.assertions = 0
    end
  end
end
