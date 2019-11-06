class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def order
    #if order is assigned, it will return that instance. if it is null it will create a new order
    @order ||= Order.find_or_create_by(token) do |order|
      order.sub_total = 0
    end
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.items.find_or_create_by(
      product_id: product_id
    )

    order_item.price = product.price
    order_item.quantity = quantity

    order_item.save
  end

end