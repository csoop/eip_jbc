class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :destroy]
  def new
  	@buyer = Buyer.new(:user_id => current_user.id)
  end

  def index
    @buyers = Buyer.all
  end

  # POST /buyers
  def create
  	@buyer = Buyer.new(buyer_params)

    respond_to do |format|
      if @buyer.save
        if params[:userurl]
          format.html { redirect_to usercar_path(@buyer.id) }
        else
          format.html { redirect_to @buyer, notice: '创建成功!' }
          format.json { render :show, status: :created, location: @buyer }
        end
      else
        format.html { render :new }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
  	 end
    end
  end

  def show
  end

  def edit
    if params[:bj].blank?
      @buyer.update_column('flag',2)
    else
      @buyer.update_column('flag',1)
    end
   redirect_to :order_audit
  end
  
  def order_audit
    @buyers=Buyer.all
    @buyers.each do |s|
      @pictures=s.pictures
    end
  end

  def destroy
    @buyer.destroy
    @id=@buyer.pictures
    @path= "#{Rails.root}/uploads/picture/image/#{@id}"
    if File.exist?(@path)
      File.delete(@path)
    end
    redirect_to :order_audit
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buyer_params
      params.require(:buyer).permit(:fabric, :ppname, :styleid, :user_id, :color => [])
    end
end
