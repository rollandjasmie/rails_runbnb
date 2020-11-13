class FraisSuplesController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # GET /frais_suples
  def index
    logement = Logement.find(params[:logement_id])
    
    if logement.frais_suples.present?  
        frais_suples = logement.frais_suples
       render json:{
         ok:frais_suples
       }
    else
      render json:{
         ok: :"no"
       }
    end
  end

  def create
    frais_suple = FraisSuple.new(types:params[:types], montant:params[:montant], facturation:params[:facturation], logement_id:params[:logement_id])

    if frais_suple.save
      render json:{
        frais_suple:frais_suple
      }
    else
      render json:{
        frais_suple:frais_suple.errors,
         status: :unprocessable_entity
      }
    end
  end

  def update
    logement = Logement.find(params[:logement_id])
    frais_suple = FraisSuple.find(params[:id])
    if frais_suple.update(types:params[:types], montant:params[:montant], facturation:params[:facturation])
      render json: {
        frais_suple:frais_suple}
    end
  end

end
