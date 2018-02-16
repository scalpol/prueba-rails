class TodosController < ApplicationController

  def index
    @todos = Todo.all.order(:completed)
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.create(todo_params)
    redirect_to todos_path
  end

  def show
    @todo = find
    if @todo.completed == true
      @done = "Está hecha."
    else
      @done = "Aun no ha sido completada."
    end
  end

  def edit
    @todo = find
  end

  def update
    @todo = find
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo = find
    @todo.delete
    redirect_to todos_path
  end

  def complete
    @todo = find
    @todo.update(completed: true)
    redirect_to todos_path
  end

  def list
    @todos_undone = Todo.all.where(completed: false)
    @todos_done = Todo.all.where(completed: true)
  end

  private

  def find
    Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description)
  end

end
