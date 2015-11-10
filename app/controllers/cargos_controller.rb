class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :edit, :update, :destroy]

  # GET /cargos
  def index
    @cargos = Cargo.all
  end

  # GET /cargos/1
  def show
  end

  # GET /cargos/new
  def new
    @cargo = Cargo.new
  end

  # GET /cargos/1/edit
  def edit
  end

  # POST /cargos
  def create
    @cargo = Cargo.new(cargo_params)

    if @cargo.save
      redirect_to @cargo, notice: 'Cargo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cargos/1
  def update
    if @cargo.update(cargo_params)
      redirect_to @cargo, notice: 'Cargo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cargos/1
  def destroy
    @cargo.destroy
    redirect_to cargos_url, notice: 'Cargo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cargo_params 
      params.require(:cargo).permit(:origin_id, :destination_id, :arrival_deadline_on)
    end
end
