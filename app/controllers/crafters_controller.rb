class CraftersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index filter search search_enter]
  before_action :find_crafter, only: %i[show edit update destroy]
  before_action :form_crafter, only: %i[create update]

  def index
    @categories = Category.all
    @all_crafters = Crafter.all.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @portfolio_items = PortfolioItem.all
    @categories = Category.all
  end

  def new
    @new_crafter = Crafter.new
  end

  def create
    # creating crafter will be automated by user Register
  end

  def edit
    @categories = Category.all
  end

  def update
    if @crafter.update(@form_data)
      if params[:crafter][:profilePic_link]
        uploaded_file = params[:crafter][:profilePic_link].path
        cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
        @crafter.profilePic_link = cloudnary_file['public_id']
        @crafter.save
        # render json: cloudnary_file
      end
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

  def filter
    p params[:category_id]
    if params[:category_id] == ''
      @filtered = Crafter.all
    else
      @filtered = Crafter.where(category_id: params[:category_id])
    end

    respond_to do |format|
      format.js
      # format.json { render json: {  success: true,
      #                               data: @filtered }}
    end
  end

  def search
    @search_crafters = Crafter.where('name ~* ?', params[:search_input])

    respond_to do |format|
      format.js
      format.json { render json: { success: true, data: @search_crafters }}
    end
  end

  def search_enter
    @filtered = Crafter.where('name ~* ?', params[:search_input])

    respond_to do |format|
      format.js { render action: 'filter' }
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
