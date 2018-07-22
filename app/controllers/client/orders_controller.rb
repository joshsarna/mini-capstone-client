class Client::OrdersController < ApplicationController
  def new
  end

  def create
    response = Unirest.post("localhost:3000/api/orders")
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
