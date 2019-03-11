json.data do
  json.partial! 'product', product: @product
  json.categories @product.categories.pluck(:name)
end
