class CraftersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_crafter, only: %i[show edit update destroy]
  before_action :form_crafter, only: %i[create update]

  def index
    @all_crafters = Crafter.all
  end

  def show
    @portfolio_items = PortfolioItem.all

  end

  def new
    @new_crafter = Crafter.new
  end

  def create
    # creating crafter will be automated by user Register
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
    if @crafter.destroy
      redirect_to crafters_path
    else
      render 'crafters/show'
    end
  end

  private

  def find_crafter
    @crafter = Crafter.find(params[:id])
  end

  def form_crafter
    @form_data = params
    .require(:crafter)
    .permit(:name, :biography, :profession, :category_id, :contact_number, :contact_email, :facebook_link, :twitter_link, :website_link)
  end
end
