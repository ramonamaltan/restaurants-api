class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end
end
