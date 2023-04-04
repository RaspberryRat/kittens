class KittensController < ApplicationController
  before_validation :set_kitten, on: %i[show edit update destroy]
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "You have create a kitten!"
      redirect_to @kitten
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
