# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :price, presence: true
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :variants, class_name: 'ProductVariant'
  paginates_per 6
end
