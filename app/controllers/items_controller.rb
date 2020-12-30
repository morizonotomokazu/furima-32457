class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :set_item, only: [:show,:edit,:update]
  before_action :prohibit_access,only:[:edit,:update]

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
    # if @item.destroy
        #  redirect_to root_path
    # else
        #  render :show
    # end
  # end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

   



  private
  def item_params
    params.require(:item).permit( :name, :text,:price,:category_id ,:status_id,:shipping_fee_id,:prefecture_id ,:scheduled_delivery_id,:image).merge(user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prohibit_access
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end
end
