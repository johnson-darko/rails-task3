class ListsController < ApplicationController
  before_action :set_params, only: %i[show  destroy]

  def index
    @lists = List.all
  end


  def show
    
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    
    if @list.save!
      redirect_to list_path(@list), notice: "Your list has been added!!"
    else
      render :new, status: :unprocessable_entity
    end
  end




  def destroy
   
    @list.destroy
    redirect_to lists_path, notice: "Item has been deleted from the lists!!"
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_params
    @list = List.find(params[:id])
  end
end
