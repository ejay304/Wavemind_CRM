  class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_project 
  before_action :authenticate_employee!, except: [:show]

  helper DropboxDocument

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @tasks = Task.where activity_id: params[:id]
    @task = Task.new
    @task_types = TaskType.all
    @task_states = Task.states
    @document = Document.new
    @documents = Document.where activity_id: params[:id]
    @document_types = DocumentType.all

    @client = Dropbox::API::Client.new(:token  => current_user.db_token, :secret => current_user.db_secret)
  end

  # GET /activities/new
  def new
    @project = Project.find(params[:project_id])
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.project_id = params["project_id"]

    respond_to do |format|
      if @activity.save
        format.html { redirect_to project_activity_path(params[:project_id], @activity), notice: "L'activité a été ajoutée" }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: "L'activité a été mise à jour" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to project_activities_url(params[:project_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :beginDate, :endDate, :ref, :project_id)
    end
end
