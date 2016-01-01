class LegsController < RestCmdsController
  
  # see RestCmdsController for actions:  :index :show :new :edit :create :update :destroy
  
  private
          
    def controlled_klass
      Leg
    end
    
    def controlled_klass_presenter
      LegPresenter
    end
    
    def controlled_klass_index_url
      legs_url
    end

    def permit_params 
      params.require(:leg).permit(:load_location_id, :load_time, :unload_location_id, :unload_time)
    end
    
    def search_criteria
      criteria = Criteria.new
      if q = params[:q]    
        load_location_id = (q||'').strip.to_i
        criteria.where(load_location_id: load_location_id)
      end
      criteria
    end

end
