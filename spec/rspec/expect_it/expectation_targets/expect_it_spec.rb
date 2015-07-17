require "spec_helper"

describe RSpec::ExpectIt::ExpectationTargets::ExpectIt do
  let(:context) do
    double("context").tap do |context|
      allow(context).to receive(:expect) {|arg| expect(arg) }
      allow(context).to receive(:subject) { context_subject }
    end
  end

  let(:passed_subject) { nil }

  subject { RSpec::ExpectIt::ExpectationTargets::ExpectIt.new(context, passed_subject) }

  describe "#to" do
    context "when the subject is passed" do
      let(:passed_subject) { Object.new }

      specify { subject.to eq passed_subject }
    end

    context "when the subject is not passed" do
      let(:context_subject) { Object.new }

      specify { subject.to eq context_subject }
    end
  end

  describe "#not_to" do
    context "when the subject is passed" do
      let(:passed_subject) { Object.new }

      specify { expect{ subject.to_not eq passed_subject }.to raise_error(RSpec::Expectations::ExpectationNotMetError) }
    end

    context "when the subject is not passed" do
      let(:context_subject) { Object.new }

      specify { expect{ subject.to_not eq context_subject }.to raise_error(RSpec::Expectations::ExpectationNotMetError) }
    end
  end
end
