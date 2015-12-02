class RestCmdsController < ApplicationController
  
  def index                      
    @prez = Cmds::Query.new(controlled_klass, search_criteria).call 
  end 

  def show
    @prez = Cmds::Find.new(controlled_klass, params[:id]).call   
  end

  def new
    @prez = controlled_klass_presenter.new
  end

  def edit
    @prez = Cmds::Find.new(controlled_klass, params[:id]).call  
  end                                                                       

  def create
    @prez = Cmds::Create.new(controlled_klass, permit_params).call

    if @prez.target.new_record?
      render :new
    else
      redirect_to @prez.target, notice: "#{controlled_klass} was successfully created."
    end
  end

  def update
    @prez = Cmds::Update.new(controlled_klass, params[:id], permit_params).call 
    if @prez.errors.present?
      render :edit
    else
      redirect_to @prez.target, notice: "#{controlled_klass} was successfully updated."
    end
  end

  def destroy
    @prez = Cmds::Destroy.new(controlled_klass, params[:id]).call 
    redirect_to controlled_klass_index_url, notice: "#{controlled_klass} was successfully destroyed."
  end

end
