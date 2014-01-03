module RSpec
  module ExpectIt
    module ExpectationTargets
      class ExpectIt
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
    end
  end
end