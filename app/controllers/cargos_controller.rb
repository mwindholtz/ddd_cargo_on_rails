class CargosController < RestCmdsController
  
  # see RestCmdsController for actions:  :index :show :new :edit :create :update :destroy
  
  private
          
    def controlled_klass
      Cargo
    end
    
    def controlled_klass_presenter
      CargoPresenter
    end
    
    def controlled_klass_index_url
      cargos_url
    end

    def permit_params 
      params.require(:cargo).permit(:origin_id, :destination_id, :arrival_deadline_on)
    end
    
    def search_criteria
      criteria = Criteria.new
      if q = params[:q]    
        destination_id = (q||'').strip.to_i
        criteria.where(destination_id: destination_id)
      end
      criteria
    end

end
