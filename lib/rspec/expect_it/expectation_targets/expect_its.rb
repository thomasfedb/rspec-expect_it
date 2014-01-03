module RSpec
  module ExpectIt
    module ExpectationTargets
      class ExpectIts < ExpectIt
        attr_accessor :method

        def initialize(context, method)
          super(context)
          self.method = method
        end

        private

        def get_subject
          context.subject.send(method)
        end
      end
    end
  end
end