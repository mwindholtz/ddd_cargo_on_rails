class CargosController < ApplicationController
  
  # GET /cargos
  def index
    @prez = Cmds::CargoQuery.new.call 
  end 

  # GET /cargos/1
  def show
    load_cargo
  end

  # GET /cargos/new
  def new
    @prez = CargoPresenter.new
  end

  # GET /cargos/1/edit
  def edit
    load_cargo
  end

  # POST /cargos
  def create
    cargo = Cargo.new(cargo_params)
    @prez = CargoPresenter.new(cargo)

    if cargo.save
      redirect_to cargo, notice: 'Cargo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cargos/1
  def update
    cargo = load_cargo

    if cargo.update(cargo_params)
      redirect_to cargo, notice: 'Cargo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cargos/1
  def destroy
    cargo = load_cargo
    cargo.destroy
    redirect_to cargos_url, notice: 'Cargo was successfully destroyed.'
  end

  private
    def load_cargo
      @prez= Cmds::CargoFind.new(params[:id]).call
      @prez.target
    end

    # Only allow a trusted parameter "white list" through.
    def cargo_params 
      params.require(:cargo).permit(:origin_id, :destination_id, :arrival_deadline_on)
    end
end
