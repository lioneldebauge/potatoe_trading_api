require "rails_helper"

RSpec.describe Api::V1::PricesController do
  describe "#index" do
    let(:min_time) { now.to_i - 1000 }
    let(:max_time) { now.to_i + 1000 }
    let(:now) { Time.zone.now }
    let(:expected_response) { Price.order(time: :desc).as_json }
    let(:params) { { min_time: min_time, max_time: max_time } }

    before do
      create_list(:price, 3) do |price, i|
        price.time = now + i
        price.value = 100 + i
        price.save!
      end

      get "/api/v1/prices", params: params
    end

    it "returns a successful http status" do
      expect(response).to have_http_status(:successful)
    end
    
    it "the response body returns the expected payload in json format" do
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
    
    context "when a params is invalid" do
      let(:max_time) { "invalid" }
      let(:error_message) { "Bad request: invalid params" }
            
      it "returns a bad request http status" do
        expect(response).to have_http_status(:bad_request)
      end
      
      it "returns an error message" do
        expect(response.body).to eq error_message
      end
    end

    context "when a params is blank" do
      let(:max_time) { "" }
      let(:error_message) { "Bad request: missing params" }
            
      it "returns a bad request http status" do
        expect(response).to have_http_status(:bad_request)
      end
      
      it "returns an error message" do
        expect(response.body).to eq error_message
      end
    end

    context "when a params is absent" do
      let(:error_message) { "Bad request: missing params" }
      let(:params) { { min_time: min_time } }

      it "returns a bad request http status" do
        expect(response).to have_http_status(:bad_request)
      end
      
      it "returns an error message" do
        expect(response.body).to eq error_message
      end
    end
  end
end