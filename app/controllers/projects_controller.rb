class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update]
  before_action :set_all_votes, only: [:show, :update]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @votes = Vote
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def add_vote
    unless params[:project_id].nil?
      @thisUser = current_user.id
      ActiveRecord::Base.connection.execute("DELETE FROM votes WHERE user_id = " + @thisUser.to_s)
      @project = Project.find(params[:project_id])
      @newVote = Vote.create!(vote_value: true, user_id: current_user.id, project_id: @project.id)
      respond_to do |format|
   	    format.html { redirect_to @project, notice: 'Your vote has been recorded'} 
   	    format.json { render :show, status: :ok, location: @project } 
 	    end
    end
  end
  
  def summary
    @projects = Project.all
    @votes = Vote.all
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_all_votes
      @votes = Vote.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :video_url, :description, :images, :team_name, :vote_count)
    end
end
