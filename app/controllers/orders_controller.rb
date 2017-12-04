class OrdersController < ApplicationController
  def index
      @all_status = ['Placed','Shipped','Canceled']
      a=Hash.new()
      a['Placed']=true
      a['Shipped']=true
      a['Canceled']=true
      @checked_status = params[:status]||session[:status]||a
      if params[:commit] == "Refresh"
        session[:status] = @checked_status
      else
        @checked_status = session[:status]
      end
      @orders = Order.where(:status => @checked_status)
    
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def new
    @order = Order.new
    @order_items = current_order.order_items
    @order.order_items=current_order.order_items
  end
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = "Order deleted"
    redirect_to orders_url
  end
  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:success] = "Order information updated!"
      redirect_to orders_url
    else
      render 'edit'
    end
  end
  def create
    @order = Order.new(order_params)
    @order_items = current_order.order_items
    @order.order_items=current_order.order_items
    if @order.save
      @order.status="Placed"
      redirect_to order_path(@order), notice: "The order has been successfully created."
    else
      render action: "new"
    end
  end


  private
    def order_params
    params.require(:order).permit(:status,:name,:email,:address,:phone)
    end

end
