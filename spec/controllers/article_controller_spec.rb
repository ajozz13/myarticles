require "rails_helper"

RSpec.describe "Article Controller Tests", type: :request do
  context "POST attempts" do
    it "Creates a new Article" do
      hdrs = { "CONTENT_TYPE" => "application/json" }
      pyl = { title: "Another Simple Article", body: "This is a second large article", author_id: 1 }.to_json
      post "/api/v1/articles", params: pyl, headers: hdrs
      expect( response ).to have_http_status( :created )
      json = JSON.parse( response.body )
      expect( json["code"] ).to be( 0 )
      expect( json["message"] ).to match( /Created/ )
      expect( json["is_error"] ).to be( false )
      expect( json["url"] ).to_not be_nil
      expect( json["data"] ).to_not be_nil

    end
  end
end
