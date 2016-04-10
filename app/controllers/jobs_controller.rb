class JobsController < ApplicationController
  before_action :current_user

  def index
    if params[:tag]
      @jobs = Job.tagged_with(params[:tag])
    else
    	@jobs = Job.page(params[:page]).per(8)
    end
  end

  def new
  	@job = Job.new
  end

  def create
  	@job = Job.new(job_params)
		if @job.save
			redirect_to root_path
		else
			render "new"
		end
  end

  def show
    job_id = params[:id]
    @job = Job.find(job_id)
    render "show"
  end

  def edit
    job_id = params[:id]
    @job = Job.find(job_id)
    render "edit"
  end

  def update
    job_id = params[:id]
    @job = Job.find(job_id)
    # get updated data
    update_attributes = job_params
    # update the job
    @job.update_attributes(job_params)
    # redirect to index page
    redirect_to jobs_path
  end

  def destroy
    job_id = params[:id]
    @job = Job.find(job_id)
    @job.destroy
    redirect_to jobs_path 
  end

  private
  
  def job_params
    params.require(:job).permit(:title, :company, :city, :url, :all_tags)
  end

end
