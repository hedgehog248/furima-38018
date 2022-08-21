class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  pivate
  def items_params
    params.require(:item).permit(:image)
  end
end
