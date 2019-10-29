class KijisController < ApplicationController
  before_action :set_kiji, only: [:show, :edit, :update, :destroy]

  include KijisHelper
  # GET /kijis
  # GET /kijis.json
  def index
    @kijis = Kiji.all
  end

  # GET /kijis/1
  # GET /kijis/1.json
  def show
  end

  # GET /kijis/new
  def new
    @kiji = Kiji.new
  end

  # GET /kijis/1/edit
  def edit
    @kiji=Kiji.find(params[:id])
    if auther?
    else
      redirect_to root_path
    end
  end

  # POST /kijis
  # POST /kijis.json
  def create
    @kiji = Kiji.new(strong_params_kiji)
    @kiji.user_id=current_user[:id]
    if @kiji.save   
      flash[:success] = "Kiji was successfully created"
      redirect_to root_path
    else
      flash.now[:danger]="invalid creation"
      render "new"
    end
  end

  def strong_params_kiji
    params.require(:kiji).permit(:title,:content)
  end

  # PATCH/PUT /kijis/1
  # PATCH/PUT /kijis/1.json
  def update
  
    if @kiji.update(kiji_params)
      flash[:success]='Kiji was successfully updated.' 
      redirect_to root_path
    else
      flash.now[:danger]="Kiji was not successfully update"
      render "new"
    end
  end

  # DELETE /kijis/1
  # DELETE /kijis/1.json
  def destroy
    @kiji.destroy
    respond_to do |format|
      format.html { redirect_to kijis_url, notice: 'Kiji was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kiji
      @kiji = Kiji.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kiji_params
      params.require(:kiji).permit(:title, :content, :user_id)
    end
end
