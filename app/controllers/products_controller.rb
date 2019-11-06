# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.includes(:variants).order(:title)
  end

  def show_all_products
    @all_products = Product.all.order(:title)
  end

  def show
    @product = Product.find(params[:id])
  end
end
