require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe "#index" do
    context "when query parameters are empty" do
      let(:response_json) { JSON.parse(response.body) }

      context "when empty response" do
        before do
          get :index, format: :json
        end

        let(:expected_response) do
          {
            data: [],
            meta: {
              from: 0,
              items: 20,
              page: 1,
              to: 0,
              total_items: 0,
              total_pages: 1,
            },
          }.as_json
        end

        it { expect(response_json).to eq(expected_response) }
      end

      context "when response returns products" do
        let!(:product) { create(:product) }
        let(:expected_response) do
          {
            data: [{
             name: product.name,
             description: product.description,
             id: product.id,
             price: {
               amount: product.price.to_s,
               currency: product.price.symbol,
             }
            }],
            meta: {
              from: 1,
              items: 1,
              page: 1,
              to: 1,
              total_items: 1,
              total_pages: 1,
            },
          }.as_json
        end

        before do
          get :index, format: :json
        end

        it { expect(response_json).to eq(expected_response) }
      end
    end
  end
end
