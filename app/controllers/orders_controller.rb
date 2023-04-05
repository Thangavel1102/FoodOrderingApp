class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    
    @order.location_id = params[:order][:location_id]
    @order.restaurant_id = params[:order][:restaurant_id]
    @order.delivery_charge = Order::DELIVERY_CHARGE
    if @order.save
      total_amt = 0
      no_of_items = 0
      params[:order][:order_items].each do |item|
        product = Product.find_by_id(item[:product_id])
        qty = item[:qty]
        price = product.unit_price * qty
        total_amt = total_amt + price
        no_of_items = no_of_items + 1
        OrderItem.create(qty: qty, price: price, product_id: product.id, order_id: @order.id)
      end
      @order.update_tax
      total_amt = (total_amt + @order.total_tax).to_f
      @order.update(no_of_items: no_of_items, total: total_amt, status: 'completed')
      @order.calculate_order_discount
      @order.calculate_discount
      @order.calculate_delivery_charge
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:no_of_items, :total, :status, :location_id, :restaurant_id, :order_items_attributes => [:id, :qty, :unit_price, :total_price, :product_id])
    end
end
