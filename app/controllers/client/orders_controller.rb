class Client::OrdersController < ApplicationController
  def new
  end

  def create
    order_params = {
      product_id: params[:product_id],
      quantity: params[:quantity]
    }
    response = Unirest.post("localhost:3000/api/orders", parameters: order_params)
    @order = response.body
    flash[:create] = "You successfully made a purchase."
    render "show.html.erb"
  end

  def show
    id = params[:id]
    response = Unirest.get("localhost:3000/api/orders/#{id}")
    @order = response.body
  end
end
