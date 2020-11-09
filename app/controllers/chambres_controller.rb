class ChambresController < ApplicationController
    before_action :authorized, only: [:auto_login]
    def index
        user = User.find(current_user.id)
        logement = user.logements
        indexa=[]
        chambres=[]
        lits=[]
                logement.each do |index|
                    indexa<<index
                index.chambres.each do |chambre|
                    chambres<<chambre
                    lit = chambre.lits
                    lits << lit
        end     
    end
        render json: {
            chambres:chambres,lits:lits,logement:indexa} 
    end
end
