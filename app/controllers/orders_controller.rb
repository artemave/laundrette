class OrdersController < ApplicationController
  before_action :set_customer, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @search = Order.search(params[:q])
    @search.sorts = 'created_at desc' if @search.sorts.empty?
    @orders = @search.result.page(params[:page])
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = @customer.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @customer.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to [@customer, @order], notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to [@customer, @order], notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def toggle_status
    order = Order.find params[:id]
    order.toggle_status

    respond_to do |format|
      format.html { redirect_to :back, notice: order.complete? ? "Order complete!" : "Order status is reset to 'New'" }
      format.json { head :no_content }
    end
  end

  def toggle_paid
    order = Order.find params[:id]
    order.toggle_paid

    respond_to do |format|
      format.html { redirect_to :back, notice: order.paid? ? "Order paid!" : "Order status is reset to 'Unpaid'" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      set_customer
      @order = @customer.orders.find(params[:id])
    end

    def set_customer
      @customer = Customer.find params[:customer_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:due_date, :paid, :notes, :sticker_number, :status, items_attributes: [
        :id, :notes, :service_id, :price, :quantity, :_destroy
      ])
    end
end
