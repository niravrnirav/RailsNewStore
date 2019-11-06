class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :current_cart

  end

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart

  private

  def cart_token
    return @cart_token unless @cart_token.nil?

    #if new session, assign new hash
    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end
end
