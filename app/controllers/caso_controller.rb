class CasoController < ApplicationController
	def new
        #@caso = Caso.new
        @user = User.find_by_id(current_user.id)
        @caso = @user.casos.build 
    end
 
    def index
        #@casos = Caso.all
        @user = User.find_by_id(current_user.id)
        @casos = @user.casos
    end
 
    def create
        #@user = User.find_by_id(current_user.id)
        #@casos = @user.casos
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

    def caso_params
    params.require(:caso).permit(:casename, :victname, :date_occu, :place_occu, :desc, :status, :owner, :user_id)

    end
end