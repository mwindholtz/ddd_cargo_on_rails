class VoyagesController < RestCmdsController
  # see RestCmdsController for actions:  :index :show :new :edit :create :update :destroy

  private

    def controlled_klass
      Voyage
    end

    def controlled_klass_presenter
      VoyagePresenter
    end

    def controlled_klass_index_url
      voyages_url
    end

    def permit_params
      params.require(:voyage).permit(:home_port_id)
    end

    def search_criteria
      criteria = Criteria.new
      q = params[:q]
      if q
        home_port_id = (q || '').strip.to_i
        criteria.where(home_port_id: home_port_id)
      end
      criteria
    end
end
