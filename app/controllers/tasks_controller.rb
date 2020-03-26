class TasksController < ApplicationController
  before_action :set_user
  
  def index
     @tasks = current_user.tasks.all
  end
  
  def show
    @task = Task.find(params[:id])
  end  
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "新しいタスクを作成しました。"
    redirect_to user_tasks_url(current_user)
    else
      render :new
    end  
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
    
       flash[:success] = "タスクを更新しました。"
       redirect_to user_task_url(current_user) 
    else
      render :edit
    end  
  end  
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url(current_user)
  end  
  
  private
  
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def task_params
      params.require(:task).permit(:name,:description,:user_id)
    end  
end
