module RSpec
  module ExpectIt
    module Helpers
      def expect_it
        if block_given?
          RSpec::ExpectIt::ExpectationTargets::ExpectIt.new(self, lambda { self.subject })
        else
          RSpec::ExpectIt::ExpectationTargets::ExpectIt.new(self)
        end
      end

      def expect_it!
        expect(subject)
      end

      def expect_its(method)
        RSpec::ExpectIt::ExpectationTargets::ExpectIts.new(self, method)
      end

      def expect_its!(method)
        expect(subject.send(method))
      end

      def expect_it_safe
        if block_given?
          safe_lambda = lambda do
            begin
              self.subject
            rescue Exception
              nil
            end
          end
          RSpec::ExpectIt::ExpectationTargets::ExpectIt.new(self, safe_lambda)
        else
          raise ArgumentError, "method must be called as expect_it_safe{}"
        end
      end
    end
  end
end