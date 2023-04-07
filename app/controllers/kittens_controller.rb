class KittensController < ApplicationController
  before_action :set_kitten, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "You have created a kitten!"
      redirect_to @kitten
    else
      flash[:error] = "You didn't follow the instructions dummy."
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "You have updated your kitten."
      redirect_to @kitten
    else
      flash[:error] = "You didn't follow the instructions dummy."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "You have killed your kitten."

    redirect_to root_path
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
