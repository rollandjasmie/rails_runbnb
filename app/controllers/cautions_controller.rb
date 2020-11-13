class CautionsController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # GET /cautions
  def index
    logement = Logement.find(params[:logement_id])
    caution = logement.caution
    render json:{
      caution:caution
    }

  end


  def update
    logement = Logement.find(params[:logement_id])
    caution = logement.caution
    if caution.update(montant:params[:montant],type_de_payment:params[:type_de_payment])
      render json: {
          caution:caution
      }
    end
  end
end
