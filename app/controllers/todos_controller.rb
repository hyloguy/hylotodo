class TodosController < ApplicationController
	before_action :set_todo, only: [:destroy, :complete]



  def index
  	@todos = Todo.all
  end

  def edit
  end

  def create
  	@todo = Todo.new(todo_params)
  	respond_to do |format|
  		if @todo.save
  			format.html { redirect_to todos_path }
  			format.json { render json: @todo }
  		else
  			format.html { render :new }
  			format.json { render json: @todo.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def destroy
  	@todo.destroy
  	respond_to do |format|
  		format.html { redirect_to todos_path }
  		format.json { head :no_content }
  	end
  end

  def complete
  	respond_to do |format|
  		if @todo.update(completed: true)
  			format.html { redirect_to @todo, notice: 'Task successfully completed.' }
  			format.json { render json: @todo }
  		else
  			format.html { render :edit }
  			format.json { render json: @todo.errors, status: :unprocessable_entity }
  		end
  	end
  end

  private

  def todo_params
  	params.require(:todo).permit(:name, :completed)
  end

  def set_todo
  	@todo = Todo.find(params[:id])
  end
end
