require 'helper'

module LXDKit

  class TestConfiguration < UnitTest

    def setup
      super
      LXDKit.config.command_map.clear
      LXDKit.config.output = LXDKit::Formatter::Pretty.new($stdout)
    end

    def test_deprecation_output
      output = ''
      LXDKit.config.deprecation_output = output
      LXDKit.config.deprecation_logger.log('Test')
      assert_equal "[Deprecated] Test\n", output.lines.first
    end

    def test_default_deprecation_output
      LXDKit.config.deprecation_logger.log('Test')
    end

    def test_nil_deprecation_output
      LXDKit.config.deprecation_output = nil
      LXDKit.config.deprecation_logger.log('Test')
    end

    def test_output
      assert LXDKit.config.output.is_a? LXDKit::Formatter::Pretty
      assert LXDKit.config.output = $stderr
    end

    def test_umask
      assert LXDKit.config.umask.nil?
      assert LXDKit.config.umask = '007'
      assert_equal '007', LXDKit.config.umask
    end

    def test_output_verbosity
      assert_equal Logger::INFO, LXDKit.config.output_verbosity
      assert LXDKit.config.output_verbosity = :debug
      assert_equal Logger::DEBUG, LXDKit.config.output_verbosity
      assert LXDKit.config.output_verbosity = Logger::INFO
      assert_equal Logger::INFO, LXDKit.config.output_verbosity
      assert LXDKit.config.output_verbosity = 0
      assert_equal Logger::DEBUG, LXDKit.config.output_verbosity
    end

    def test_default_env
      assert LXDKit.config.default_env
    end

    def test_default_runner
      assert_equal :parallel, LXDKit.config.default_runner
      LXDKit.config.default_runner = :sequence
      assert_equal :sequence, LXDKit.config.default_runner
    end

    def test_default_runner_config
      config_hash = { wait: 5 }
      config_hash_with_runner = { in: :groups, limit: 5 }
      default_hash = { in: LXDKit.config.default_runner }

      assert_equal default_hash, LXDKit.config.default_runner_config
      LXDKit.config.default_runner_config = config_hash
      assert_equal default_hash.merge(config_hash), LXDKit.config.default_runner_config
      LXDKit.config.default_runner_config = config_hash_with_runner
      assert_equal config_hash_with_runner, LXDKit.config.default_runner_config
      assert_equal config_hash_with_runner[:in], LXDKit.config.default_runner
    end

    def test_backend
      assert_equal LXDKit::Backend::Netssh, LXDKit.config.backend
      assert LXDKit.config.backend = LXDKit::Backend::Printer
      assert_equal LXDKit::Backend::Printer, LXDKit.config.backend
    end

    def test_command_map
      assert_equal LXDKit.config.command_map.is_a?(LXDKit::CommandMap), true

      cm = Hash.new { |h,k| h[k] = "/opt/sites/example/current/bin #{k}"}

      assert LXDKit.config.command_map = cm
      assert_equal LXDKit.config.command_map.is_a?(LXDKit::CommandMap), true
      assert_equal "/opt/sites/example/current/bin ruby", LXDKit.config.command_map[:ruby]
    end

    def test_setting_formatter_types
      {
        dot:        LXDKit::Formatter::Dot,
        blackhole:  LXDKit::Formatter::BlackHole,
        simpletext: LXDKit::Formatter::SimpleText,
      }.each do |format, expected_class|
        LXDKit.config.format = format
        assert LXDKit.config.output.is_a? expected_class
      end
    end

    def test_prohibits_unknown_formatter_type_with_exception
      assert_raises(NameError) do
        LXDKit.config.format = :doesnotexist
      end
    end

    def test_options_can_be_provided_to_formatter
      LXDKit.config.use_format(TestFormatter, :color => false)
      formatter = LXDKit.config.output
      assert_instance_of(TestFormatter, formatter)
      assert_equal($stdout, formatter.output)
      assert_equal({ :color => false }, formatter.options)
    end

    class TestFormatter
      attr_accessor :output, :options

      def initialize(output, options={})
        @output = output
        @options = options
      end
    end
  end

end
