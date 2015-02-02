class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :update, :destroy]
  def new
  	@buyer = Buyer.new
  end

  def index
    @buyers = Buyer.all
  end

  # POST /buyers
  def create
  	@buyer = Buyer.new(:fabric => "abd", :color => "red")

    respond_to do |format|
      if @buyer.save
        format.html { redirect_to @buyer, notice: '创建成功!' }
        format.json { render :show, status: :created, location: @buyer }
      else
        format.html { render :new }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
  	 end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @buyer.update(buyer_params)
        format.html { redirect_to @buyer, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @buyer }
      else
        format.html { render :edit }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def order_audit
  	
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buyer_params
      params.require(:buyer).permit(:fabric, :color)
    end
end
