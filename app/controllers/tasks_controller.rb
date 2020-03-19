class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    redirect_to tasks_index_url
  end
  
  def index
    @task = Task.all
  end
end
