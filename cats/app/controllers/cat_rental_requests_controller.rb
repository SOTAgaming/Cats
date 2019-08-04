class CatRentalRequestsController < ApplicationController

  def index
    @requests = CatRentalRequest.all

    render :index
  end


   def new
    @request = CatRentalRequest.new
    
    render :new
  end 


    def create
    @request = CatRentalRequest.new(request_params)

    if @request.save 
      redirect_to cat_url(@request.cat_id)
    else 
      render json: @request.errors.full_messages, status: 422
    end 
  end 

    def request_params
    params.require(:request).permit(:cat_id, :start_date, :end_date)
  end 

end
