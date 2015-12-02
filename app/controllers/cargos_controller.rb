class CargosController < ApplicationController
  
  # GET /cargos
  def index                      
    @prez = Cmds::Query.new(controlled_klass, search_criteria).call 
  end 

  # GET /cargos/1
  def show
    @prez = Cmds::Find.new(controlled_klass, params[:id]).call   
  end

  # GET /cargos/new
  def new
    @prez = controlled_klass_presenter.new
  end

  # GET /cargos/1/edit
  def edit
    @prez = Cmds::Find.new(controlled_klass, params[:id]).call  
  end                                                                       

  # POST /cargos
  def create
    @prez = Cmds::Create.new(controlled_klass, cargo_params).call

    if @prez.target.new_record?
      render :new
    else
      redirect_to @prez.target, notice: 'Cargo was successfully created.'
    end
  end

  # PATCH/PUT /cargos/1
  def update
    @prez = Cmds::Update.new(controlled_klass, params[:id], cargo_params).call 
    if @prez.errors.present?
      render :edit
    else
      redirect_to @prez.target, notice: 'Cargo was successfully updated.'
    end
  end

  # DELETE /cargos/1
  def destroy
    @prez = Cmds::Destroy.new(controlled_klass, params[:id]).call 
    redirect_to cargos_url, notice: 'Cargo was successfully destroyed.'
  end

  private
  
    def controlled_klass
      Cargo
    end
    
    def controlled_klass_presenter
      CargoPresenter
    end
    
    # Only allow a trusted parameter "white list" through.
    def cargo_params 
      params.require(:cargo).permit(:origin_id, :destination_id, :arrival_deadline_on)
    end
    
    def search_criteria
      criteria = Criteria.new
      if q = params[:q]    
        destination_id = (q||'').strip.to_i
        criteria.where("destination_id = '#{destination_id}'")
      end
      criteria
    end

end
