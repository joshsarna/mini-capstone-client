class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/products")
    @products = response.body
    render "index.html.erb"
  end

  def show
    id = params[:id]
    response = Unirest.get("localhost:3000/api/products/#{id}")
    @product = response.body
    # @product = products.find(params[:id])
    render "show.html.erb"
  end
end
