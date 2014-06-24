class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:new, :edit]
  

  # GET /users
  # GET /users.json
  def index
    @users = User.where(:type => params[:type])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.create params[:type]
    @type = User.typeName params[:type]

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)
    @user.company_id = params['company_id'] 
    @user.type = params['type']

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "L' utilisateur a été créé" }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "L'utilisateur à été mis à jour" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        #TODO y a un souci il fait pas init les deux
        @employee = User.find(params[:id])
        @user = User.find(params[:id])
    end

    def set_company
        #TODO y a un souci il fait pas init les deux
        @company = Company.find(params[:company_id])
    end

    def type 
        User.types.include?(params[:type]) ? params[:type] : "User"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(type.underscore.to_sym).permit(:name, :firstname, :phone, :fax, :function, :zip, :city, :country, :address, :type,:email, :password, :password_confirmation)
    end

end
