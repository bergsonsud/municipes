class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update]

  # GET /municipes or /municipes.json
  def index
    if Municipe.all.any? and params[:query].present?
      search_response = Municipe.search(params[:query])
      result_ids = search_response.results.map{|x| x.id}
      @municipes = Municipe.where(id: result_ids)
    else
      @municipes = Municipe.all
    end
  end

  # GET /municipes/1 or /municipes/1.json
  def show; end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  # GET /municipes/1/edit
  def edit; end

  # POST /municipes or /municipes.json
  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipes_path, notice: 'Municipe was successfully created.' }
        format.json { render :show, status: :created, location: @municipe }
        format.turbo_stream { flash.now[:notice] = 'Criado com sucesso!' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.json { render :show, status: :ok, location: @municipe }
        format.html { redirect_to municipes_path, notice: 'Atualizado com sucesso', status: :ok }
        format.turbo_stream { flash.now[:notice] = 'Atualizado com sucesso' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birthdate, :phone, :status, :picture,
                                     address_attributes: %i[street zipcode complement neighborhood city uf ibge_code])
  end
end
