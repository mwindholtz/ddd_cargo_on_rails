class ItinerariesController < RestCmdsController
  # see RestCmdsController for actions:  :index :show :new :edit :create :update :destroy

  private

    def controlled_klass
      Itinerary
    end

    def controlled_klass_presenter
      ItineraryPresenter
    end

    def controlled_klass_index_url
      itineraries_url
    end

    def permit_params
      params.require(:itinerary).permit(:start_location_id, :end_location_id, :arrival_time, :layover_minutes)
    end

    def search_criteria
      criteria = Criteria.new
      q = params[:q]
      if q
        # code = (q || '').strip.to_i
        criteria.where(start_location_id: start_location_id)
      end
      criteria
    end
end
