require "rails_helper"
require "support/shared_examples/api_controller_spec"

RSpec.describe Api::V1::BestEarningsController do
  describe "#show" do
    let(:min_time) { now.to_i - 1000 }
    let(:max_time) { now.to_i + 1000 }
    let(:now) { Time.zone.now }
    let(:best_earning) { 100 }
    let(:calculator) { instance_double(BestEarningCalculator, result: best_earning) }
    let(:expected_response) { { amount: best_earning }.to_json }
    let(:params) { { min_time: min_time, max_time: max_time } }

    before do
      allow(BestEarningCalculator).to receive(:new).and_return calculator
      get "/api/v1/best_earnings", params: params
    end

    it "returns a successful http status" do
      expect(response).to have_http_status(:successful)
    end
    
    it "the response body returns the expected payload in json format" do
      expect(response.body).to eq(expected_response)
    end

    it_behaves_like "api controller"
  end
end