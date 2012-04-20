class TasksController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@task = Task.new
  	@tasks = current_user.tasks.undone.paginate(:page => params[:page], :per_page => 10)
  end
  
  def create
  	@task = Task.new(params[:task])
  	@task.user = current_user
  	if @task.save
  		redirect_to :tasks
  	else
  		@tasks = current_user.tasks.undone.paginate(:page => params[:page], :per_page =>10)
  		render :action => 'index'
  	end
  end
  
  def finish
  	@task = Task.find(params[:id])
  	@task.update_attribute(:done, true)
  	redirect_to :back
  end
  
  def done
  	@task = Task.new
  	@tasks = current_user.tasks.done.paginate(:page => params[:page], :per_page => 10)
  	render :action => 'done'
  end
  
  def unfinish
  	@task = Task.find(params[:id])
  	@task.update_attribute(:done, false)
  	redirect_to :back
  end
	
	def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back
  end 

end
