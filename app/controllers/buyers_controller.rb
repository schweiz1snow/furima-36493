class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if current_user.id != @item.user_id && @item.buyer.present?
        redirect_to root_path
      elsif current_user.id == @item.user_id
        redirect_to root_path
      else
        @item = Item.find(params[:item_id])
        # ネストすることでルーティングが変わるので注意
        @buyer_address = BuyerAddress.new
      end
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @buyer_address = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id]) #下記のbuyer_paramsのitem_idで@itemが必要なので、定義するのを忘れずに
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      Payjp.api_key = "sk_test_9255989b40957f515aec0463"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段 
        #ここは@itemをうまく使う。
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params #ここは保存するための値を許可する部分（＝バリデーションという篩にかけるところ）
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :buyer_id).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

end
