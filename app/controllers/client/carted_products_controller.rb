class Client::CartedProductsController < ApplicationController
  def new
    render "new.html.erb"
  end

  def index
    @carted_products = Unirest.get("localhost:3000/api/carted_products").body
    render "index.html.erb"
  end

  def destroy
    response = Unirest.delete("localhost:3000/api/carted_products", parameters: {
      product_id: params[:product_id]
      }
    )
    @carted_products = Unirest.get("localhost:3000/api/carted_products").body
    render "index.html.erb"
  end

  def create
    response = Unirest.post("localhost:3000/api/carted_products", parameters: {
      product_id: params[:product_id],
      quantity: params[:quantity]
      }
    )
    @carted_product = response.body
    redirect_to "/client/carted_products"
  end
end
