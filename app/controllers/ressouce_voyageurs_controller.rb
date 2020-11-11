class RessouceVoyageursController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # GET /ressouce_voyageurs
    def index
      logement = Logement.find(params[:logement_id])
      ressources = logement.ressouce_voyageurs[0]
      render json:{
        ressources:ressources
      }
    end

    def update
      logement = Logement.find(params[:logement_id])
      ressources = logement.ressouce_voyageurs[0].title
       ressources.update(title:params[:title])
    end
end
