class PortfolioItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:all_portfolios]
  before_action :find_portfolio, only: [:edit, :update, :destroy]


    def all_portfolios
      #code
      # this method will retrieve  portfolio items from all crafters
      @all_portfolio_items = PortfolioItem.all.paginate(:page => params[:page], :per_page => 15)


    end

    def index
      @crafter = Crafter.find(params[:crafter_id])
      @portfolio_items = PortfolioItem.all
    end

    def new
      @new_portfolio_item = PortfolioItem.new
    end

    def create
      @crafter = Crafter.find(params[:crafter_id])
      @portfolio_item = PortfolioItem.new(portfolio_params)
      @portfolio_item.crafter_id = @crafter.id
      if params[:portfolio_item][:media_link]
        uploaded_file = params[:portfolio_item][:media_link].path
        cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
        params[:portfolio_item][:media_link] = cloudnary_file['public_id']
        @portfolio_item.save
      end
      if @portfolio_item.save
        flash[:notice] = 'Portfolio Item Successfully Created'
        redirect_to crafter_portfolio_items_path(@crafter)
      else
        flash[:alert] = 'Failed to Create Portfolio Item!'
        render 'new'
      end
    end

    def edit

    end

    def update
      @crafter = Crafter.find(params[:crafter_id])
          if params[:portfolio_item][:media_link] && params[:portfolio_item][:media_link] != ''
            uploaded_file = params[:portfolio_item][:media_link].path
            cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
            params[:portfolio_item][:media_link] = cloudnary_file['public_id']
          end

          if @portfolio_item.update(portfolio_params)
            flash[:notice] = 'portfolio item successfully updated'
            redirect_to crafter_portfolio_items_path(@crafter)
          else
            flash[:alert] = 'failed to update portfolio item!'
            render 'edit'
            end
      end

    def destroy
      @crafter = Crafter.find(params[:crafter_id])
      @portfolio_item.destroy
      redirect_to crafter_portfolio_items_path(@crafter)

    end

    private
    def portfolio_params
      puts "portfolio is #{@portfolio_item}"
      params.require(:portfolio_item).permit(:media_link, :description, :item_type)
    end

    def find_portfolio
      @portfolio_item = PortfolioItem.find(params[:id])
      puts @portfolio_item
    end

end
