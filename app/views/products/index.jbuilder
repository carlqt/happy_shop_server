json.data @products, partial: "product", as: :product
json.meta do
  json.from @pagy.from
  json.to @pagy.to
  json.page @pagy.page
  json.items @pagy.items
  json.total_pages @pagy.pages
  json.total_items @pagy.count
end
