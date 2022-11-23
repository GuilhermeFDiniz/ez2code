class SalesController < ApplicationController
  def show
    @sale = Sale.find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @sale = Sale.new(product: @product, user: @user)
    if @sale.save
      redirect_to product_sale_path(@product, @sale)
    end
  end

  def user_sales
    @sales = Sale.where(user_id: current_user.id)
  end
end
