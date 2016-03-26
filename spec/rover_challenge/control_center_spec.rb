require 'spec_helper'

describe RoverChallenge::ControlCenter do
  let(:plateau) { RoverChallenge.build_plateau("5 5") }
  let(:rover) { RoverChallenge.build_rover("1 2 N") }

  subject { described_class.new(plateau, rover) }

  describe "#execute" do
    let(:commands) { RoverChallenge.build_commands("LMLMLMLMM") }

    it "executes commands" do
      expect(rover).to receive(:move).exactly(5).times.and_call_original
      expect(rover).to receive(:left).exactly(4).times.and_call_original

      subject.execute(commands)

      expect(rover.to_s).to eq("1 3 N")
    end

    context "when command list contains invalid command" do
      let(:commands) { RoverChallenge.build_commands("MN") }

      it "raises ArgumentError exception" do
        expect {
          subject.execute(commands)
        }.to raise_error(ArgumentError)
      end
    end

    context "when rover moves out of plateau" do
      let(:commands) { RoverChallenge.build_commands("MMMMMM") }
      it "raises RoverOutOfBounds exception" do
        expect {
          subject.execute(commands)
        }.to raise_error(RoverChallenge::ControlCenter::RoverOutOfBounds)
      end
    end
  end
end