module RSpec
  module ExpectIt
    module Helpers
      def expect_it
        if block_given?
          ExpectItExpectationTarget.new(self, lambda { self.subject })
        else
          ExpectItExpectationTarget.new(self)
        end
      end

      def expect_it!
        expect(subject)
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
          ExpectItExpectationTarget.new(self, safe_lambda)
        else
          ExpectItSafeExpectationTarget.new(self)
        end
      end

      def expect_it_safe!
        result = begin
          self.subject
        rescue Exception
          nil
        end

        expect(result)
      end

      class ExpectItExpectationTarget
        attr_accessor :context, :subject

        def initialize(context, subject = nil)
          self.context = context
          self.subject = subject
        end

        def to(matcher)
          context.expect(get_subject).to(matcher)
        end

        def to_not(matcher)
          context.expect(get_subject).to_not(matcher)
        end

        private

        def get_subject
          subject || context.subject
        end
      end

      class ExpectItSafeExpectationTarget < ExpectItExpectationTarget
        private

        def get_subject
          begin
            subject || context.subject
          rescue Exception
            nil
          end
        end
      end
    end
  end
end