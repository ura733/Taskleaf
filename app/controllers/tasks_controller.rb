class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "「#{task.name}」を更新しました。"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "「#{task.name}」を削除しました。"
  end

  def create
    @task = current_user.tasks.new(tasks_params)

    if @task.save
      redirect_to @task, notice: "「#{@task.name}を登録しました。」"
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
