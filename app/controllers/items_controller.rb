class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :price_update]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    session[:before_url] = request.referer
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @item = Item.new(item_create_params)
  #   if @item.save
  #     flash[:success] = "商品の作成に成功しました。"
  #     redirect_to inventory_control_path(current_user)
  #   else
  #     flash[:danger] = "商品作成に失敗しました。再度やり直してください。"
  #     render "/items/product_registration"
  #   end
  # end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   if @item.update(item_params)
  #      flash[:success] = "商品データを変更しました"
  #      url=session[:before_url]
  #      session.delete(:before_url)
  #      redirect_to url
  #   else
  #       flash[:danger] = "更新に失敗しました"
  #       session.delete(:before_url)
  #       render 'edit'
  #   end
  # end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    begin
      Item.import(params[:file])
      if Item.get_processing == 1
        flash[:success] = "インポートに成功しました"
      else
        flash[:danger] = "インポートに失敗しました"
      end
    rescue StandardError => e
      logger.error e
      flash[:danger] = "ＣＳＶファイルを選択して下さい"
    end
    redirect_to "/users/#{current_user.id}/inventory_control"
  end

  def product_scarce
    @items = Item.includes(:stocks)
  end

  def product_item_number
    item = Item.find(params[:id])
    item.part_number = params[:part_number]
    item.save
    flash[:success] = "製品番号を変更しました"
    redirect_to "/users/#{current_user.id}/product_scarce"
  end

  # 僅少商品のみ
  def csv_scarceexport
    @items = Item.all
  end

  # 売切れ商品一覧
  def csv_soldoutexport
    @items = Item.all
  end

  def sold_out
    @items = Item.includes(:stocks)
  end

  def product_registration
    @item = Item.new
    @item.stocks.build
  end

  def destroy_many
    if params[:deletes].present?
      delete_list = params[:deletes].keys
      ActiveRecord::Base.transaction do
        if Item.destroy(delete_list)
          flash[:success] = "削除に成功しました"
        end
      end
    else
      flash[:danger] = "失敗しました"
    end
    redirect_to request.referer
  end

  def price_update
    if @item.update(item_price_update_params)
      flash[:success] = "想定販売額の初期設定をしました。"
    else
      flash[:danger] =  "想定販売額の初期設定に失敗しました。再度やり直してください。"
    end
    redirect_to request.referer
  end

  def buyitems_price_update
    buyitem = Buyitem.find(params[:id])
    if buyitem.update(buyitem_price_update_params)
      flash[:success] = "仕入額額の設定をしました。"
    else
      flash[:danger] =  "仕入額の設定に失敗しました。再度やり直してください。"
    end
    redirect_to request.referer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_number, :item_title, :item_picture, :china_item_picture, :part_number, :jan_code, :simulate_price, :yahoo, :amazon, :mercari, :rakuma, :rakuten, :yahooshopping, :buy_china_item_title, :buy_china_item_url, :sell_japan_url, :researcher_id, :team_id)
    end

    def item_create_params
      params.require(:item).permit(:item_title, :part_number, :simulate_price, :item_picture, :buy_item_title, :buy_item_url, :item_japan_url, :buy_item_title, :buy_item_url, :item_japan_url, :china_item_picture, :yahoo, :amazon, :mercari, :rakuma, :rakuten, :yahooshoping)
    end

    def item_price_update_params
      params.permit(:simulate_price)
    end

    def buyitem_price_update_params
      params.permit(:china_price)
    end
end
