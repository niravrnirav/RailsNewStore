# frozen_string_literal: true

class AddOrderItemToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :order, foreign_key: true, null: false
  end
end
