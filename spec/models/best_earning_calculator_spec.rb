require "rails_helper"

RSpec.describe BestEarningCalculator do
  describe "#result" do
    subject(:result) { described_class.new(min_time: min_time, max_time: max_time).result }
    let(:now) { Time.zone.now }
    let(:min_time) { now - 1000 }
    let(:max_time) { now + 1000 }

    context "when several positive earnings are possible" do
      before do
        [100, 110, 80, 100].each_with_index do |value, i|
          Price.create!(value: value, time: now + i )
        end
      end

      it "returns the highest earning possible" do
        expect(result).to eq 20
      end
    end

    context "when no positive earning is possible" do
      before do
        [4, 3, 2, 1].each_with_index do |value, i|
          Price.create!(value: value, time: now + i )
        end
      end

      it { is_expected.to eq 0 }
    end

    context "when there are no prices" do
      let!(:prices) { [] }
      
      it { is_expected.to eq 0 }
    end

    context "when there is only one price" do
      let!(:prices) { [create(:price)] }
      
      it { is_expected.to eq 0 }
    end
  end
end