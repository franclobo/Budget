class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.includes([:classes]).where(author: current_user.id)
  end

  def show
    @inventory = Inventory.find(params[:id])
    @item = @inventory.item
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.author = current_user.id
    if @inventory.save
      redirect_to inventory_path(@inventory)
    else
      render :new
    end
  end

  def most_recent
    @inventories = Inventory.includes([:classes]).where(author: current_user.id).order(created_at: :desc)
    render :index
  end

  def most_ancient
    @inventories = Inventory.includes([:classes]).where(author: current_user.id).order(created_at: :asc)
    render :index
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :icon)
  end
end
