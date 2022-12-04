require "rails_helper"

RSpec.shared_examples "api controller" do
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