json.(
  product,
  :id,
  :name,
  :description
)

json.price do
  json.amount product.price.to_s
  json.currency product.price.symbol
end
