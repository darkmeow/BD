class CasoController < ApplicationController
	def new
        @caso = Caso.new
    end
 
    def index
        @casos = Caso.all
    end
 
    def create
        @caso = Caso.new(params[:caso].permit(:casename, :victname, :date_occu, :place_occu, :desc, :status, :owner))
        @caso.save
 
        redirect_to caso_path    # esta ruta se explica a continuación
 
    end
end