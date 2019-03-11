require 'swagger_helper'

describe 'Products API' do
  path '/products' do
    get 'Displays list of products' do
      tags 'Products'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer, description: "Get items from page"
      parameter name: :sort, in: :query, type: :string, enum: ["price", "-price"], description: "Order product list by price in ASC or DESC"
      parameter name: :price, in: :query, type: :string, description: "Example value is 1000..3000. This means that filter products from 1000 price_cents to 3000 price_cents"
      parameter name: :categories, in: :query, type: :array, items: { type: :string }, description: "Filter products by its categories"

      response '200', 'Request success' do
        schema type: :object,
        properties: {
          data: {
            type: :array,
            items: {
              '$ref' => '#/definitions/product_list_response'
            }
          },
          meta: {
            '$ref' => '#/definitions/meta_response'
          }
        }

        let(:page) { 1 }
        let(:price) { 100..3000 }
        let(:categories) { ['organic'] }
        let(:sort) { 'price' }

        run_test!
      end
    end
  end

  path '/products/{id}' do
    get 'Displays a products' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'products list' do
        schema type: :object,
        properties: {
          data: {
            '$ref' => '#/definitions/product_response'
          },
        }

        let!(:id) { create(:product).id }
        run_test!
      end
    end
  end
end
