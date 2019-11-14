# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.includes(:variants).order(:title)
  end

  def show_all_products
    @query = params[:query].downcase

    @all_products = Product.where('lower(title) LIKE ?', "%#{@query}%").order(:title).page params[:page]

    if !params[:category_id].nil? && params[:category_id] != '89'
      category = Category.find(params[:category_id])
      @all_products = category.products.where('lower(title) LIKE ?', "%#{@query}%").order(:title).page params[:page]
    else
      @all_products = Product.where('lower(title) LIKE ?', "%#{@query}%").order(:title).page params[:page]
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
