# frozen_string_literal: true

RSpec.describe "Root", type: :request do
  it "returns the current account" do
    logged_in(email: "user@example.com")

    get "/", {}, { "HTTP_ACCEPT" => "application/json" }

    expect(last_response).to be_successful
    expect(json_response["email"]).to eq "user@example.com"
    expect(json_response["status"]).to eq "verified"
  end

  it "requires authentication" do
    get "/", {}, { "HTTP_ACCEPT" => "application/json" }

    expect(last_response.status).to eq 401
    expect(json_response["error"]).to eq "Please login to continue"
  end
end
