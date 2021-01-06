class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :sold_out_item, only: [:index]
  before_action :credit_item,only: [:index,:create]
  def index
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(purchase_params)
    if @credit.valid?
      pay_item
      @credit.save
      return redirect_to root_path
    else
      return render 'index'
    end
  end

  private
  def purchase_params
    params.require(:credit).permit(:postal_code, :prefecture_id, :city, :house_number,:building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price ,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

    def move_to_index
       @item = Item.find(params[:item_id])
      unless @item.user_id != current_user.id
       redirect_to root_path
      end
    end
    def sold_out_item
        redirect_to root_path if @item.order.present?
    end
    def credit_item
      @item = Item.find(params[:item_id])
    end
  
  
end
