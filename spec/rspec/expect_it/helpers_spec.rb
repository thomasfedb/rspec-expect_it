require "spec_helper"

describe RSpec::ExpectIt::Helpers do
  describe "expect_it" do
    describe "equalivalence" do
      subject { Object.new }

      specify { expect_it.to eq subject }
    end

    describe "lazy evaluation" do
      before { @value = 0 }

      subject { @value = 1 }

      specify { expect_it.to eq (@value + 1) }
    end 

    describe "unsaftey" do
      subject { raise Exception }

      specify { expect{ expect_it.to be nil }.to raise_error(Exception) }
    end
  end

  describe "expect_it!" do
    describe "equalivalence" do
      subject { Object.new }

      specify { expect_it!.to eq subject }
    end

    describe "unlazy evaluation" do
      before { @value = 0 }

      subject { @value = 1 }

      specify { expect_it!.to eq @value }
    end 

    describe "unsaftey" do
      subject { raise Exception }

      specify { expect{expect_it!.to be nil}.to raise_error(Exception) }
    end
  end

  describe "expect_it{}" do
    describe "equalivalence" do
      before { @value = 0 }

      subject { @value += 1 }

      specify { expect_it{}.to be_a Proc }
      specify { expect_it{}.to change{@value}.by(1) }
    end

    describe "unsaftey" do
      subject { raise Exception }

      specify { expect{ expect_it{}.to_not change{0} }.to raise_error(Exception) }
    end
  end

  describe "expect_its" do
    describe "equalivalence" do
      let(:result) { Object.new }

      subject { double("subject").tap {|s| s.stub(:method) { result } } }

      specify { expect_its(:method).to eq subject.method }
    end

    describe "lazy evaluation" do
      before { @value = 0 }

      subject { double("subject").tap {|s| s.stub(:method) { @value = 1 } } }

      specify { expect_its(:method).to eq (@value + 1) }
    end 

    describe "unsaftey" do
      subject { double("subject").tap {|s| s.stub(:method) { raise Exception } } }

      specify { expect{ expect_its(:method).to eq nil }.to raise_error(Exception) }
    end
  end

  describe "expect_its!" do
    describe "equalivalence" do
      let(:result) { Object.new }

      subject { double("subject").tap {|s| s.stub(:method) { result } } }

      specify { expect_its!(:method).to eq subject.method }
    end

    describe "unlazy evaluation" do
      before { @value = 0 }

      subject { double("subject").tap {|s| s.stub(:method) { @value = 1 } } }

      specify { expect_its!(:method).to eq @value }
    end 

    describe "unsaftey" do
      subject { double("subject").tap {|s| s.stub(:method) { raise Exception } } }

      specify { expect{ expect_its!(:method).to eq nil }.to raise_error(Exception) }
    end
  end

  describe "expect_it_safe" do
    describe "equalivalence" do
      subject { Object.new }

      specify { expect_it_safe.to eq subject }
    end

    describe "lazy evaluation" do
      before { @value = 0 }

      subject { @value = 1 }

      specify { expect_it_safe.to eq (@value + 1) }
    end 

    describe "saftey" do
      subject { raise Exception }

      specify { expect_it_safe.to eq nil }
    end
  end

  describe "expect_it_safe!" do
    describe "equalivalence" do
      subject { Object.new }

      specify { expect_it_safe!.to eq subject }
    end

    describe "unlazy evaluation" do
      before { @value = 0 }

      subject { @value = 1 }

      specify { expect_it_safe!.to eq @value }
    end 

    describe "saftey" do
      subject { raise Exception }

      specify { expect_it_safe!.to eq nil }
    end
  end

  describe "expect_it_safe{}" do
    describe "equalivalence" do
      before { @value = 0 }

      subject { @value += 1 }

      specify { expect_it_safe{}.to be_a Proc }
      specify { expect_it_safe{}.to change{@value}.by(1) }
    end

    describe "saftey" do
      before { @value = 0 }

      subject { raise Exception }

      specify { expect{ expect_it_safe{}.to_not change{0} }.to_not raise_error(Exception) }
    end
  end
end