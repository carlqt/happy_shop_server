require 'swagger_helper'

describe 'Products API' do
  path '/products' do
    get 'Displays list of products' do
      tags 'Products'
      produces 'application/json'
      parameter name: :categories, in: :query, type: :array, items: { type: :string }, description: "Filter products by its categories"
      parameter name: :page, in: :query, type: :integer, description: "Get items from page"
      parameter name: :sort, in: :query, type: :string, enum: ["price", "-price"], description: "Order product list by price in ASC or DESC"
      parameter name: :price, in: :query, type: :string, description: "Example value is 1000..3000. This means that filter products from 1000 price_cents to 3000 price_cents"

      response '200', 'products list' do
        schema '$ref' => '#/definitions/product'
      end
    end
  end

  path '/products/{id}' do
    get 'Displays a products' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'products list' do
        schema '$ref' => '#/definitions/product'

        let!(:product) { create(:product) }
      end
    end
  end
end
