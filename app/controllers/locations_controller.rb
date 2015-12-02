class LocationsController < RestCmdsController
  
  # see RestCmdsController for actions:  :index :show :new :edit :create :update :destroy
  
  private
          
    def controlled_klass
      Location
    end
    
    def controlled_klass_presenter
      LocationPresenter
    end
    
    def controlled_klass_index_url
      locations_url
    end

    def permit_params 
      params.require(:location).permit(:name, :code)
    end
    
    def search_criteria
      criteria = Criteria.new
      if q = params[:q]    
        code = (q||'').strip.to_i
        criteria.where("code = '#{code}'")
      end
      criteria
    end

end
