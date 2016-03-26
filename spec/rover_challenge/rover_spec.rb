require 'spec_helper'

describe RoverChallenge::Rover do
  let(:point) { RoverChallenge::Point.new(1, 1) }
  let(:navigation) { RoverChallenge::Navigation::North }

  subject { described_class.new(point, navigation) }

  describe "#move" do
    it "changes rover's point" do
      expect(navigation).to receive(:move).with(point).and_call_original
      expect { subject.move }.to change { point }
    end
  end

  describe "#left" do
    it "changes rover's navigation" do
      expect(navigation).to receive(:left).and_call_original
      expect { subject.left }.to change { subject.navigation }
    end
  end

  describe "#right" do
    it "changes rover's navigation" do
      expect(navigation).to receive(:right).and_call_original
      expect { subject.right }.to change { subject.navigation }
    end
  end

  describe "#to_s" do
    it "returns string representation of rover's position" do
      expect(subject.to_s).to eq("1 1 N")
    end
  end
end