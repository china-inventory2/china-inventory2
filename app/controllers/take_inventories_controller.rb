class TakeInventoriesController < ApplicationController
  before_action :set_take_inventory, only: [:show, :edit, :update, :destroy]

  # GET /take_inventories
  # GET /take_inventories.json
  def index
    @take_inventories = TakeInventory.all
  end

  # GET /take_inventories/1
  # GET /take_inventories/1.json
  def show
  end

  # GET /take_inventories/new
  def new
    @take_inventory = TakeInventory.new
  end

  # GET /take_inventories/1/edit
  def edit
  end

  # POST /take_inventories
  # POST /take_inventories.json
  def create
    @take_inventory = TakeInventory.new(take_inventory_params)

    respond_to do |format|
      if @take_inventory.save
        format.html { redirect_to @take_inventory, notice: 'Take inventory was successfully created.' }
        format.json { render :show, status: :created, location: @take_inventory }
      else
        format.html { render :new }
        format.json { render json: @take_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /take_inventories/1
  # PATCH/PUT /take_inventories/1.json
  def update
    respond_to do |format|
      if @take_inventory.update(take_inventory_params)
        format.html { redirect_to @take_inventory, notice: 'Take inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @take_inventory }
      else
        format.html { render :edit }
        format.json { render json: @take_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /take_inventories/1
  # DELETE /take_inventories/1.json
  def destroy
    @take_inventory.destroy
    respond_to do |format|
      format.html { redirect_to take_inventories_url, notice: 'Take inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_take_inventory
    @take_inventory = TakeInventory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def take_inventory_params
    params.require(:take_inventory).permit(:fiscal_year, :beginning_product_inventory, :cost_of_sales, :period_end_product_inventory, :user_id)
  end
end
