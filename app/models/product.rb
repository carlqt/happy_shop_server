class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories

  monetize :price_cents

  scope :categories, lambda { |categories|
    joins(:categories)
      .where(categories: { name: categories })
      .group(:id)
      .having("COUNT(*) = #{categories.length}")
  }

  scope :price, ->(price_range) { where(price_cents: price_range) }

  def self.filter(params)
    result = self.where(nil)
    params.each do |key, val|
      result = result.public_send(key, val) if val.present?
    end

    result
  end

  def self.sort(params)
  end
end
