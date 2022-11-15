class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat), status: :see_other
  end

  def destroy
    @flat.delete
    redirect_to flat_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :number_of_guests)
  end
end
