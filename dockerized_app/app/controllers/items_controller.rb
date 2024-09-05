class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)

    if @item.save
      redirect_to items_path
    else
      redirect_to new_item_path
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :quantity)
  end
end
