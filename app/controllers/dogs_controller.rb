class DogsController < ApplicationController
  before_action :set_dog, only:[:show, :edit, :update,]

  def index
    @dogs= Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.new(dog_params)
    if dog.save
      flash[:notice] = "You created a dog!"
      redirect_to dog_path(dog)
    else
      @dog = dog
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      flash[:notice] = "You updated a dog!"
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    flash[:notice] = "You successfully deleted a dog!"
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
