require "helper"
require "lxdkit"

module LXDKit
  module Runner
    class TestSequential < UnitTest
      def test_wraps_ruby_standard_error_in_execute_error
        host = Host.new("deployer@example")
        runner = Sequential.new([host]) { raise "oh no!" }
        error = assert_raises(LXDKit::Runner::ExecuteError) do
          runner.execute
        end
        assert_match(/deployer@example/, error.message)
        assert_match(/oh no!/, error.message)
      end
    end
  end
end
