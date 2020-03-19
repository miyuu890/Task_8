class TasksController < ApplicationController
  
  def new
  end
  
  def create
    redirect_to tasks_index_url
  end
  
  def index
  end
end
