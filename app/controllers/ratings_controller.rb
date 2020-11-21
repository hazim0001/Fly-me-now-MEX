class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    authorize @rating
  end

  def create
    authorize @rating
    if @rating.create(rating_params)
      redirect_to @rating.airplane, notice: "Thank you for your rating"
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:renter, :airplane, :rating)
  end
end
