class KijisController < ApplicationController
  before_action :set_kiji, only: [:show, :edit, :update, :destroy]

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
    kiji=Kiji.find(params[:id])
    if kiji.user_id == @current_user.id
    else
      redirect_to root_path
    end
  end

  # POST /kijis
  # POST /kijis.json
  def create
    @kiji = Kiji.new(params[:kiji])
    @kiji.user_id=@current_user.id
    if @kiji.save   
      redirect_to root_path
    else
      flash[:danger]="invalid creation"
    end
  end

  # PATCH/PUT /kijis/1
  # PATCH/PUT /kijis/1.json
  def update
    respond_to do |format|
      if @kiji.update(kiji_params)
        format.html { redirect_to @kiji, notice: 'Kiji was successfully updated.' }
        format.json { render :show, status: :ok, location: @kiji }
      else
        format.html { render :edit }
        format.json { render json: @kiji.errors, status: :unprocessable_entity }
      end
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
