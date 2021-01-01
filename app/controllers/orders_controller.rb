class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @credit = Credit.new
  end

  def create
    @item = Item.find(params[:item_id])
    @credit = Credit.new
    if @credit.valid?
      @credit.save
      return redirect_to root_path
    else
      return 'index'
    end
  end

  private
  def purchase_params
    params.permit(:postal_code,:city,:house_number,:building_name,:phone_number,:prefecture_id,:item_id,:order_id).merge(user_id: current_user.id)
  end

end
