class ConditionsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def show
  end

  def upadte
    log = Logement.find_by(id:params[:longement_id])
    condition= log.condition
    
      if     @condition = condition.update(conditions:params[:condition])
          render json:{
            adresse:@condition
          }
        
      else
        
      end
  end

  def delete
  end
end
