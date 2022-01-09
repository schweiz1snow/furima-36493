class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @buyer_address = BuyerAddress.new
  end

  def new
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :buyer_id, :user_id, :item_id).merge(user_id: current_user.id)
  end

end
