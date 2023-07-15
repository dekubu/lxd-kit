module LXDKit

  module Runner

    class Null < Abstract

      def execute
        LXDKit::Backend::Skipper.new(&block).run
      end
    end
  end
end
