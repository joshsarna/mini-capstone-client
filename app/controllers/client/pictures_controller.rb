class Client::PicturesController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
      url: params["url"],
      product_id: params[:product_id]
    }

    response = Unirest.post("http://localhost:3000/api/pictures",
      parameters: client_params
    )
    flash[:success] = 'Successfully added picture!'
    redirect_to "/client/products/#{params[:product_id]}"
  end
end
