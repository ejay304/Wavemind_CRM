class ActivityStatesController < ApplicationController
  before_action :set_activity_state, only: [:show, :edit, :update, :destroy]

  # GET /activity_states
  # GET /activity_states.json
  def index
    @activity_states = ActivityState.all
  end

  # GET /activity_states/1
  # GET /activity_states/1.json
  def show
  end

  # GET /activity_states/new
  def new
    @activity_state = ActivityState.new
  end

  # GET /activity_states/1/edit
  def edit
  end

  # POST /activity_states
  # POST /activity_states.json
  def create
    @activity_state = ActivityState.new(activity_state_params)

    respond_to do |format|
      if @activity_state.save
        format.html { redirect_to @activity_state, notice: 'Activity state was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity_state }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_states/1
  # PATCH/PUT /activity_states/1.json
  def update
    respond_to do |format|
      if @activity_state.update(activity_state_params)
        format.html { redirect_to @activity_state, notice: 'Activity state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_states/1
  # DELETE /activity_states/1.json
  def destroy
    @activity_state.destroy
    respond_to do |format|
      format.html { redirect_to activity_states_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_state
      @activity_state = ActivityState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_state_params
      params.require(:activity_state).permit(:name)
    end
end
