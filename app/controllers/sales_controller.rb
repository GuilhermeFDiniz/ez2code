class SalesController < ApplicationController
  def show
    @sale = Sale.find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])

    @sale = Sale.new(product: @product, user: current_user)
    respond_to do |format|
      if @sale.save
        # Diz ao UserMailer para enviar o _welcome e-mail_ caso o usuário seja salvo
        UserMailer.order_email(current_user, @product).deliver_now
        format.html { redirect_to product_sale_path(@product, @sale), notice: 'Compra realizada.' }
        format.json { render json: current_user, status: :created, location: current_user }
      else
        format.html { render action: 'show' }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
    # if @sale.save
    #   UserMailer.with(user: current_user).order_email(current_user).deliver_now
    # redirect_to product_sale_path(@product, @sale)
    # raise
    # end
  end

  def my_sales
    @products = Product.where(user_id: current_user.id)
    @sales = []
    @products.each do |product|
      @sales << Sale.where(product_id: product)
    end
    @sales.flatten!
  end

  def user_sales
    @sales = Sale.where(user_id: current_user.id)
  end
end
