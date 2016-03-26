require 'spec_helper'

describe RoverChallenge do
  describe ".build_rover" do
    let(:input) { "1 2 N" }
    subject { described_class.build_rover(input) }

    it { is_expected.to be_an_instance_of(RoverChallenge::Rover) }

    it "parses point input" do
      expect(subject.point).to be_an_instance_of(RoverChallenge::Point)
      expect(subject.point.x).to eq(1)
      expect(subject.point.y).to eq(2)
    end

    it "parses navigation input" do
      expect(subject.navigation).to be(RoverChallenge::Navigation::North)
    end

    context "when input is invalid" do
      let(:input) { "invalid" }
      it "raises ArgumentError exception" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".build_plateau" do
    let(:input) { "5 5" }
    subject { described_class.build_plateau(input) }

    it { is_expected.to be_an_instance_of(RoverChallenge::Plateau) }

    it "parses plateau coordinates" do
      expect(subject.min_x).to eq(0)
      expect(subject.min_y).to eq(0)
      expect(subject.max_x).to eq(5)
      expect(subject.max_y).to eq(5)
    end

    context "when input is invalid" do
      let(:input) { "invalid" }
      it "raises ArgumentError exception" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end