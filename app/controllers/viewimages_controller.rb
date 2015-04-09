class ViewimagesController < ApplicationController
  before_action :set_viewimage, only: [:edit, :update, :destroy]

  def index
    @viewimages = Viewimage.all
  end

  # GET /viewimages/new
  def new
    @viewimage = Viewimage.new
  end


  # POST /viewimages
  # POST /viewimages.json
  def create
    @viewimage = Viewimage.new(viewimage_params)

    respond_to do |format|
      if @viewimage.save
        format.html { redirect_to :viewimages, notice: '创建成功!' }
        format.json { render :index, status: :created, location: @viewimage }
      else
        format.html { render :new }
        format.json { render json: @viewimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viewimages/1
  # DELETE /viewimages/1.json
  def destroy
    @viewimage.destroy
    # @id=@viewimage
    # @path= "#{Rails.root}/uploads/viewimage/image/#{@id}"
    # if File.exist?(@path)
    #   File.delete(@path)
    # end
    respond_to do |format|
      format.html { redirect_to viewimages_url, notice: 'Viewimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viewimage
      @viewimage = Viewimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viewimage_params
      params.require(:viewimage).permit(:image, :title, :content)
    end
end
