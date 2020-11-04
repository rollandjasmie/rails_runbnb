class LogementsController < ApplicationController
    before_action :authorized, only: [:auto_login]
    def index
        user = User.find(current_user.id)
        logement = user.logements
        indexa=[]
        adresses=[]
                logement.each do |index|
                    indexa<<index
                    adresse = index.adresse
                    adresses << adresse

    end     
  

                render json: {logement:indexa,
                adresse:adresses}            
    end
    
    def create
       
        @logement = Logement.new(logement_params)
        @logement.user_id = current_user.id
        @logement.save
        @chambre = Chambre.create(title:"Chambre",logement_id: @logement.id)
        @salon = Salon.create(title: "Salon",logement_id: @logement.id)
        @autre = Autre.create(title: "Autre espace",logement_id: @logement.id)


        #adresse controller new
        @adresse = Adresse.new(adresse_params)
        @adresse.logement_id = @logement.id
        @adresse.save
        
        #map controller new
        @map = Map.new(map_params)
        @map.logement_id = @logement.id
        @map.save

        #conditions controller new
        @condition = Condition.new(condition_params)
        @condition.logement_id = @logement.id
        @condition.save

        #equipement controller new
        @equipement = Equipement.new(params_equipement)
        @equipement.logement_id=@logement.id
        @equipement.save

         #regle controller new
         @regle = Regle.new(regle_params)
         @regle.logement_id = @logement.id
         @regle.save

        #image controller new
        # image = params[:photo]
        # photo=Photo.new(photo:image)
        # photo.logemenent_id=@logement.id
        # photo.save!
        # puts '$'*200
        # puts params[:photo]
        # puts '$'*200
        


        
         #calendrier controller new
         @cal = Calendrier.new(cal_params)
         @cal.logement_id = @logement.id
         @cal.save

        lits = params[:Lits]
        lits.each do |lit|
               @lits = Lit.new(name:lit["name"],quantite:lit["quantite"],checked:lit["checked"])
               @lits.chambre_id = @chambre.id
               @lits.save
            
        end

        canapes = params[:canapes]
        canapes.each do |canape|
            @lits = Canape.new(name:canape["name"],quantite:canape["quantite"],checked:canape["checked"])
            @lits.salon_id = @chambre.id
            @lits.save 
        end
        
        autres = params[:autres]
        autres.each do |autre|
            @lits = Autrelit.new(name:autre["name"],quantite:autre["quantite"],checked:autre["checked"])
            @lits.autre_id = @chambre.id
            @lits.save 
        end

        render json:{
            lit:@lits,
            canape:@canape,
            autre:@autre
        }
          
    end

    def update
        log = Logement.find_by(id:params[:id])
        
        if log=log.update(name:params[:name],types:params[:types],categorie:params[:categorie])
            render json: {
                status: :log
            }
        else
           render json:{ 
               erreur: :error 
            } 
        end
        
    end
    

     private 

    def logement_params
        params.require(:hebergement).permit(:name, :types, :categorie)
    end
    def adresse_params
        params.require(:localisation).permit(:pays, :ville, :adresse, :code)
    end
    def params_equipement
        params.require(:equipement).permit(title: [])
    end
    
    def map_params
        params.require(:map).permit(:latitude, :longitude)
    end
    def condition_params
        params.require(:conditions).permit(:conditions)
    end
    def regle_params
        params.require(:regles).permit(:arrive1, :arrive2, :depart1, :depart2, regle: [])
    end
    def cal_params
        params.require(:date).permit( :startDate , :endDate)
    end
end



