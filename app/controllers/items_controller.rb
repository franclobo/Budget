class ItemsController < ApplicationController
  def new
    @inventory = Inventory.find(params[:inventory_id])
    @item = Item.new
    @inventories = Inventory.where(user:id: current_user.id)
  end

  def create
    @item = Item.new(item_params)
    @item.author = current_user.id
    @inventory = Inventory.find(params[:inventory_id])
    if params[:inventories_ids]
      params[:inventories_ids].each do |inventory_id|
        Inventory.find(inventory_id).items << @item
      end
    end
    redirect_to inventory_path
  else
    redirect_to new_inventory_item_path(@inventory)
  end
end
