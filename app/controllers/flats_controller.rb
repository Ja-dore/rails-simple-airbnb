class FlatsController < ApplicationController
  before_action :find_resto, only: %i[edit show update destroy]
  def index
    @flats = Flat.all
  end

  def show; end

  def new
    # hier moet wel iets staan om de form_for te kunnen gebruiken
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params_flats)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    @flat.update(params_flats)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flas
    @flat = Flat.find(params[:id])
  end

  def params_flats
    params.require(:flat).permit(:name, :address, :category)
  end
end
