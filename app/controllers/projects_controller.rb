class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
  def index
  	# Project.paginate(page: params[:page], per_page: 5)
    if current_user.user_type == 'Manager'
      @projects=current_user.managerprojects.paginate(page: params[:page], per_page: 5)
    else
      @projects=current_user.projects.paginate(page: params[:page], per_page: 5)
    end
  end

  def new
  	@project=Project.new
  	
  end
  def create
    @project = Project.new(project_params)
        
        @project.manager=current_user
		
        respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
  	
	@participants=@project.developers
  	

  end
  def destroy
	@project.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def edit
    @users=User.where(user_type: 'Developer').all
    @users1=User.where(user_type: 'QA').all
    @users=@users+@users1
  end
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

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params

      params.require(:project).permit(:title, :description,:developer_ids => [])
    end

end