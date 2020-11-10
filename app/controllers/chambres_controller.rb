class ChambresController < ApplicationController
    before_action :authorized, only: [:auto_login]
    def index
        user = User.find(current_user.id)
        logement = Logement.find_by(id:params[:logement_id])
        chambres = logement.chambres
        salons = logement.salons
        autres = logement.autres

        chambre = Chambre.find_by(logement_id: params[:logement_id])
        lits = chambre.lits

        salon = Salon.find_by(logement_id: params[:logement_id])
        canapes = salon.canapes

        autre = Autre.find_by(logement_id: params[:logement_id])
        autrelits = autre.autrelits

        render json: {
            chambres:chambres,lits:lits,logement:logement,salons:salons,
            autres:autres,canapes:canapes,autrelits:autrelits} 
    end
end
