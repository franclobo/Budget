class ItemsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def new
    @inventory = Inventory.find(params[:inventory_id])
    @item = Item.new
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def create
    @item = Item.new(item_params)
    @item.author = current_user
    @inventory = Inventory.find(params[:inventory_id])
    if params[:inventories_ids]
      params[:inventories_ids].each do |inventory_id|
        inventory = Inventory.find(inventory_id)
        inventory.items << @item
      end
      redirect_to inventories_path
    else
      redirect_to new_inventory_item_path(@inventory)
      nil
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
