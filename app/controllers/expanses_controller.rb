class ExpansesController < ApplicationController
  before_action :set_expanse, only: %i[show edit update destroy]

  # GET /expanses or /expanses.json
  def index
    @expanses = Expanse.all
  end

  # GET /expanses/1 or /expanses/1.json
  def show; end

  # GET /expanses/new
  def new
    @expanse = Expanse.new
  end

  # GET /expanses/1/edit
  def edit; end

  # POST /expanses or /expanses.json
  def create
    @expanse = Expanse.new(expanse_params)

    respond_to do |format|
      if @expanse.save
        format.html { redirect_to expanse_url(@expanse), notice: 'Expanse was successfully created.' }
        format.json { render :show, status: :created, location: @expanse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expanse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expanses/1 or /expanses/1.json
  def update
    respond_to do |format|
      if @expanse.update(expanse_params)
        format.html { redirect_to expanse_url(@expanse), notice: 'Expanse was successfully updated.' }
        format.json { render :show, status: :ok, location: @expanse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expanse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expanses/1 or /expanses/1.json
  def destroy
    @expanse.destroy

    respond_to do |format|
      format.html { redirect_to expanses_url, notice: 'Expanse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expanse
    @expanse = Expanse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expanse_params
    params.require(:expanse).permit(:name, :amount)
  end
end
