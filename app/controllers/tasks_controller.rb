class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(active: true)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new(board_id: params[:board_id])
    respond_to do |format|
      format.js
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, error: 'Oops an error occurred!' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to request.referrer, notice: 'Task was successfully updated.' }
        format.json { render :no_content }
      else
        format.html { redirect_to request.referrer }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.update_attribute(:active, false)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check
    @task = Task.find(params[:task_id])
    @task.update_attribute(:done, true)
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Task was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def uncheck
    @task = Task.find(params[:task_id])
    @task.update_attribute(:done, false)
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Task was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :active, :done, :board_id, :stage_id)
    end
end
