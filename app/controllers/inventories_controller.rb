class InventoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @inventories = Inventory.includes([:groups]).where(author: current_user)
  end

  def show
    @inventory = Inventory.find(params[:id])
    @items = @inventory.items.order(created_at: :desc)
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.author = current_user
    if @inventory.save
      redirect_to inventory_path(@inventory)
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :icon)
  end
end
