class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      if request.xhr?
        render '_task.html.erb', layout: false
      else
        redirect_to root_url
      end
    else
      @errors = @task.errors.full_messages
      render 'new'
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])

    if @task
      if request.xhr?
        @task.done = !@task.done
        @task.save
        render '_task.html.erb', layout: false
      else
        render 'edit'
      end
    else
      redirect_to root_url
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task
      @task.done = !@task.done
      @task.save
    end
    redirect_to root_url
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    @task.destroy

    redirect_to root_url
  end

  private
  def task_params
    params.require(:task).permit(:title, :description)
  end
end
