json.data @products, partial: "product", as: :product
json.meta do
  json.page @pagy.page
  json.items @pagy.items
  json.total_pages @pagy.pages
end
