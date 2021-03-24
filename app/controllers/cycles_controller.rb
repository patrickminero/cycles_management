class CyclesController < ApplicationController
  before_action :set_cycle, only: %i[ show edit update destroy new_component new_subcomponent ]

  # GET /cycles or /cycles.json
  def index
    @cycles = Cycle.all
  end

  # GET /cycles/1 or /cycles/1.json
  def show
  end

  # GET /cycles/new
  def new
    @cycle = Cycle.new
  end

  # GET /cycles/1/edit
  def edit
  end

  def new_component
  end

  def add_components
    @cycle = Cycle.find(params[:id])
    component = {
                name: params[:cycle][:component_name],
                impacts: {
                  climate_change: params[:cycle][:climate_change], 
                  water_use: params[:cycle][:water_use]
                  }
                }
    @cycle.components << component
    respond_to do |format|
      if @cycle.save!
        categories_sum(params[:cycle][:climate_change].to_i, params[:cycle][:water_use].to_i)
        format.html { redirect_to new_component_path(@cycle), notice: 'Component was successfully added.'}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def new_subcomponent
  end

  def add_subcomponents
    @cycle = Cycle.find(params[:id])
    subcomponent = {
        name: params[:cycle][:component_name],
        components: [
          { name: params[:cycle][:subcomponent_name],
            impacts: {
              climate_change: params[:cycle][:climate_change],
              water_use: params[:cycle][:water_use]
            }
          }
        ]
      }
    
    @cycle.components[@cycle.components.length] = subcomponent
    respond_to do |format|
      if @cycle.save!
        categories_sum(params[:cycle][:climate_change].to_i, params[:cycle][:water_use].to_i)
        format.html { redirect_to new_subcomponent_path(@cycle), notice: 'Component was successfully added.'}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def categories_sum(climate_change, water_use)
    @cycle = Cycle.find(params[:id])
    @cycle.categories_sum(climate_change, water_use)
  end

  def delete_component
    @cycle = Cycle.find(params[:id])
    @cycle.components.delete_at(params[:format].to_i)
    
    if @cycle.save!
      redirect_to edit_cycle_path(@cycle)
    else
      render :edit
    end
  end

  def delete_subcomponent
    @cycle = Cycle.find(params[:id])
    @cycle.components[params[:index].to_i]["components"].delete_at(params[:ind].to_i)
    pp @cycle
    if @cycle.save!
      redirect_to edit_cycle_path(@cycle)
    else
      render :edit
    end
  end

  # POST /cycles or /cycles.json
  def create
    @cycle = Cycle.new(cycle_params)

    respond_to do |format|
      if @cycle.save
        format.html { redirect_to add_components_path(@cycle), notice: "Cycle was successfully created." }
        format.json { render :show, status: :created, location: @cycle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycles/1 or /cycles/1.json
  def update
    respond_to do |format|
      if @cycle.update(cycle_params)
        format.html { redirect_to @cycle, notice: "Cycle was successfully updated." }
        format.json { render :show, status: :ok, location: @cycle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycles/1 or /cycles/1.json
  def destroy
    @cycle.destroy
    respond_to do |format|
      format.html { redirect_to cycles_url, notice: "Cycle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cycle_params
      params.require(:cycle).permit(:name, :components, :component_name, :subcomponent_name, :climate_change, :water_use, :impacts)
    end
end
