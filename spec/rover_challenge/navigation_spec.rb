require 'spec_helper'

describe RoverChallenge::Navigation do
  let(:point) { RoverChallenge::Point.new(1, 1) }
  subject { described_class }

  describe RoverChallenge::Navigation::North do
    describe ".move" do
      it "changes point's y coordinate" do
        expect { subject.move(point) }.to change { point.y }.by(1)
      end
    end

    describe ".left" do
      it "returns east navigation" do
        expect(subject.left).to be(RoverChallenge::Navigation::West)
      end
    end

    describe ".right" do
      it "returns west navigation" do
        expect(subject.right).to be(RoverChallenge::Navigation::East)
      end
    end
  end

  describe RoverChallenge::Navigation::East   do
    describe ".move" do
      it "changes point's x coordinate" do
        expect { subject.move(point) }.to change { point.x }.by(1)
      end
    end

    describe ".left" do
      it "returns north navigation" do
        expect(subject.left).to be(RoverChallenge::Navigation::North)
      end
    end

    describe ".right" do
      it "returns south navigation" do
        expect(subject.right).to be(RoverChallenge::Navigation::South)
      end
    end
  end

  describe RoverChallenge::Navigation::South   do
    describe ".move" do
      it "changes point's y coordinate" do
        expect { subject.move(point) }.to change { point.y }.by(-1)
      end
    end

    describe ".left" do
      it "returns east navigation" do
        expect(subject.left).to be(RoverChallenge::Navigation::East)
      end
    end

    describe ".right" do
      it "returns west navigation" do
        expect(subject.right).to be(RoverChallenge::Navigation::West)
      end
    end
  end

  describe RoverChallenge::Navigation::West   do
    describe ".move" do
      it "changes point's x coordinate" do
        expect { subject.move(point) }.to change { point.x }.by(-1)
      end
    end

    describe ".left" do
      it "returns south navigation" do
        expect(subject.left).to be(RoverChallenge::Navigation::South)
      end
    end

    describe ".right" do
      it "returns north navigation" do
        expect(subject.right).to be(RoverChallenge::Navigation::North)
      end
    end
  end
end