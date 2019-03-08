class ProductsController < ApplicationController
  before_action :format_price_param

  def index
    @products = Product.filter(filter_params)
  end

  private

  def filter_params
    params.slice(:categories, :price)
  end

  def format_price_param
    return unless params[:price]

    price_low, price_high = params[:price].split("..").map(&:to_i)
    params[:price] = price_low..price_high
  end
end