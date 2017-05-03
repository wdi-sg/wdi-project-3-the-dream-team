class CraftersController < ApplicationController
  before_action :find_crafter, only: %i[show edit]
  before_action :form_crafter, only: %i[create update]

  def index
    @all_crafters = Crafter.all
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
    if @crafter.update(@form_data)
      redirect_to crafter_path(@crafter)
    else
      render 'crafters/edit'
    end
  end

  def destroy
  end

  private

  def find_crafter
    @crafter = Crafter.find(params[:id])
  end

  def form_crafter
    @form_data = params.require(:crafter).permit(:id, :crafter_id)
  end
end
