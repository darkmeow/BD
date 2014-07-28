class CasosController < ApplicationController
  before_action :set_caso, only: [:show, :edit, :update, :destroy]

  # GET /casos
  # GET /casos.json
  def index
      @user = User.find_by_id(current_user.id)
        @casos = @user.casos
  end

  # GET /casos/1
  # GET /casos/1.json
  def show
  end

  # GET /casos/new
  def new
    @user = User.find_by_id(current_user.id)
    @caso = @user.casos.build 
  end

  # GET /casos/1/edit
  def edit
  end

  # POST /casos
  # POST /casos.json
  def create
    @user = User.find_by_id(current_user.id)
        @caso = @user.casos.build(caso_params) 
        
        respond_to do |format|
          if @caso.save
            format.html { redirect_to @caso, notice: 'Profile was successfully created.' }
            format.json { render :show, status: :created, location: @caso }
          else
            format.html { render :new }
            format.json { render json: @caso.errors, status: :unprocessable_entity }
          end
          
         #redirect_to caso_path    # esta ruta se explica a continuación
        end
  end

  # PATCH/PUT /casos/1
  # PATCH/PUT /casos/1.json
  def update
    respond_to do |format|
      if @caso.update(caso_params)
        format.html { redirect_to casos_url, notice: 'Caso was successfully updated.' }
        format.json { render :show, status: :ok, location: casos_url }
      else
        format.html { render :edit }
        format.json { render json: @caso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casos/1
  # DELETE /casos/1.json
  def destroy
    @caso.destroy
    respond_to do |format|
      format.html { redirect_to casos_url, notice: 'Caso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caso
      @caso = Caso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caso_params
        params.require(:caso).permit(:casename, :victname, :date_occu, :place_occu, :desc, :status, :owner, :user_id)

    end
end
