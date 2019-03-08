json.data @products
json.meta do
  json.page @pagy.page
  json.items @pagy.items
  json.total_pages @pagy.pages
end
