require "rails_helper"

RSpec.describe BestEarningCalculator do
  describe "#result" do
    subject(:result) { described_class.new(min_time: min_time, max_time: max_time).result }
    let(:now) { Time.zone.now }
    let(:min_time) { now - 1000 }
    let(:max_time) { now + 1000 }

    context "when there are at least 2 prices" do
      let!(:max_price) { create :price, time: max_time, value: 1000 }
      let!(:min_price) { create :price, time: min_time + 10, value: 1 }
      let!(:other_price1) { create :price, value: max_price.value + 100, time: min_price.time - 10 }
      let!(:other_price2) { create :price, value: max_price.value - 10, time: max_time }

      it "returns the best earning according to the prices" do
        expect(result).to eq 999
      end
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