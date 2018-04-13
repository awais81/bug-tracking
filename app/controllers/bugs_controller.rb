class BugsController < ApplicationController
	before_action :set_bug, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource

	def new
  		@bug=Bug.new
  		@project=Project.find(params[:project_id])
  	end
  	def edit
  		
  	end
  	def create
  		@project=Project.find(params[:project_id])
	    @bug = Bug.new(bug_params)
	    @bug.project=@project  
	    @bug.creator=current_user
			
	    respond_to do |format|
	      if @bug.save
	        format.html { redirect_to project_path(@project), notice: 'Bug was successfully created.' }
	        format.json { render :show, status: :created, location: project_path(@project) }
	      else
	        format.html { render :new }
	        format.json { render json: @bug.errors, status: :unprocessable_entity }
	      end
	    end
  	end
  	def update  
        
      respond_to do |format|
        if @bug.update(bug_params)
          format.html { redirect_to project_bug_path(@project,@bug), notice: 'Bug was successfully updated.' }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  def destroy
  	@bug.destroy
      respond_to do |format|
        format.html { redirect_to project_path(@project), notice: 'Bug was successfully destroyed.' }
        format.json { head :no_content }
      end
  end
  def show
  end
  private
  	def set_bug
      @bug = Bug.find(params[:id])

      @project=Project.find(params[:project_id])
    end
	  	def bug_params

	      params.require(:bug).permit(:title, :description,:developer_id,:deadline,:status,:bug_type,:screenshot,:remove_screenshot)
	    end
end