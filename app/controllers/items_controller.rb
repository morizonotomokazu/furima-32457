class ItemsController < ApplicationController
<<<<<<< Updated upstream
  def index
     
  end
=======
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!,except: [:index]
  before_action :set_item, except: [:index, :new, :create]

  def index
    @item = Item.includes(:user)
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

  private
  def item_params
    params.require(:item).permit( :name, :text,:price,:category_id ,:status_id,:shipping_fee_id,:prefecture_id ,:scheduled_delivery_id,:image).merge(user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end

   # def move_to_index
    # unless user_signed_in?
      # redirect_to action: :index
    # end

  
>>>>>>> Stashed changes
end
