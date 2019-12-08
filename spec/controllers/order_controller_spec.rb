require "rails_helper"

RSpec.describe OrderController, :type => :controller do
  describe "Post create" do
    let(:order) { build(:order) }

    it "has a 200 status code if api validation ok" do
      allow(ProcessOrder).to receive(:call).and_return(order)
      post :create
      expect(response.status).to eq(200)
    end

    it "has a status 400 code if process order raises an error" do
      allow(ProcessOrder).to receive(:call).and_raise(ProcessOrderError)
      post :create
      expect(response.status).to eq(400)
    end
  end
end