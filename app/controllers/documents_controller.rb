class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  def validate

  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    @document.activity_id = params['activity_id']

    respond_to do |format|  
      if @document.save
        format.html { redirect_to project_activity_path(params['project_id'],params['activity_id']), notice: 'Document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document }
      else
          format.html {
            set_activity_view
            render "activities/show"
          }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    def set_activity_view
      @activity = Activity.find(params['activity_id'])
      @project = Project.find(params['project_id'])
      @tasks = Task.where activity_id: params['activity_id']
      @task = Task.new
      @task_types = TaskType.all
      @task_states = Task.states
      @document_types = DocumentType.all
      @documents = Document.where activity_id: params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :link, :date, :document_type_id, :activity_id, :link_file_name)
    end
  end
