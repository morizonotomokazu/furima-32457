class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :set_item, except: [:index,:new,:create]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  # def destroy
    # if item.destroy
        #  redirect_to root_path
    # else
        #  render :show
    # end
  # end

  def show
    @item = Item.find(params[:id])
  end

   



  private
  def item_params
    params.require(:item).permit( :name, :text,:price,:category_id ,:status_id,:shipping_fee_id,:prefecture_id ,:scheduled_delivery_id,:image).merge(user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
