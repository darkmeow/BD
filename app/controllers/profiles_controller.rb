class ProfilesController < ApplicationController
  before_action :authenticate_user!, :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    #@profiles = Profile.all
    @user = User.find_by_id(current_user.id)
    @profile = @user.profile
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
 def edit
    @profile = Profile.find_by_user_id(current_user.id)
    if @profile.nil?
      redirect_to new_profile_path
    end
  end
  # POST /profiles
  # POST /profiles.json
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to edit_profile_path(:id => current_user.id)
    else
      render 'new'
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
 def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to edit_profile_path(:id => current_user.id)
    else
      render 'edit'
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find_by_user_id(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :lastname, :nickname, :twitter_profile, :facebook_profile, :instagram_profile, :user_id)
    end
end
