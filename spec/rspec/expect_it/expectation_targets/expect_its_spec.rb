require "spec_helper"

describe RSpec::ExpectIt::ExpectationTargets::ExpectIts do
  let(:context) do
    double("context").tap do |context|
      allow(context).to receive(:expect) {|arg| expect(arg) }
      allow(context).to receive(:subject) { context_subject }
    end
  end

  let(:context_subject) do
    double("subject").tap do |subject|
      allow(subject).to receive(method) { method_return_value }
    end
  end

  let(:method) { :a_method }
  let(:method_return_value) { Object.new }

  subject { RSpec::ExpectIt::ExpectationTargets::ExpectIts.new(context, method) }

  describe "#to" do
    specify { subject.to eq method_return_value }
  end

  describe "#not_to" do
    specify { expect{ subject.to_not eq method_return_value }.to raise_error(RSpec::Expectations::ExpectationNotMetError) }
  end
end
