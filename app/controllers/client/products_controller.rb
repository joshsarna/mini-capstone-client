class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/products", parameters: {
      search: "#{params[:search]}",
      search_type: "#{params[:search_type]}",
      sort_by: "#{params[:sort_by]}"
      }
    )
    @products = response.body
    flash[:search_message] = "Showing results for '#{params[:search]}'"
  end

  def create
    response = Unirest.post("localhost:3000/api/products", parameters:
      {
        input_name: params[:input_name],
        input_author: params[:input_author],
        input_price: params[:input_price],
        input_description: params[:input_description],
        input_format: params[:input_format],
        input_condition: params[:input_format],
        input_image_url: params[:input_image_url],
        input_supplier_id: params[:input_supplier_id]
      }
    )
    @product = response.body
    flash[:create] = "You successfully added a book to the store."
    redirect_to "/client/products/#{@product['id']}"
  end

  def show
    id = params[:id]
    response = Unirest.get("localhost:3000/api/products/#{id}")
    @product = response.body
  end

  def edit
    response = Unirest.get("localhost:3000/api/products/#{params[:id]}")
    @product = response.body
  end

  def update
    client_params = {
      input_name: params[:input_name],
      input_author: params[:input_author],
      input_price: params[:input_price],
      input_description: params[:input_description],
      input_format: params[:input_format],
      input_condition: params[:input_condition],
      input_image_url: params[:input_image_url]
    }
    response = Unirest.patch("localhost:3000/api/products/#{params[:id]}", parameters: client_params)
    @product = response.body
    flash[:update] = "You successfully updated this book posting."
    redirect_to "/client/products/#{@product['id']}"
  end

  def destroy
    response = Unirest.delete("localhost:3000/api/products/#{params[:id]}")
    flash[:delete] = "You removed this book from the store."
    redirect_to "/client/products"
  end
end
