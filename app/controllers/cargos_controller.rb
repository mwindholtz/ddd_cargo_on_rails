class CargosController < ApplicationController
  
  # GET /cargos
  def index
    @prez = Cmds::CargoQuery.new.call 
  end 

  # GET /cargos/1
  def show
    @prez = Cmds::CargoFind.new(params[:id]).call   
  end

  # GET /cargos/new
  def new
    @prez = CargoPresenter.new
  end

  # GET /cargos/1/edit
  def edit
    @prez = Cmds::CargoFind.new(params[:id]).call   
  end

  # POST /cargos
  def create
    @prez = Cmds::CargoCreate.new(cargo_params).call

    if @prez.target.new_record?
      render :new
    else
      redirect_to @prez.target, notice: 'Cargo was successfully created.'
    end
  end

  # PATCH/PUT /cargos/1
  def update
    @prez = Cmds::CargoUpdate.new(params[:id], cargo_params).call   
    if @prez.errors.present?
      render :edit
    else
      redirect_to @prez.target, notice: 'Cargo was successfully updated.'
    end
  end

  # DELETE /cargos/1
  def destroy
    @prez = Cmds::CargoFind.new(params[:id]).call   
    @prez.target.destroy
    redirect_to cargos_url, notice: 'Cargo was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def cargo_params 
      params.require(:cargo).permit(:origin_id, :destination_id, :arrival_deadline_on)
    end
end
