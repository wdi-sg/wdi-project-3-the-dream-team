class PortfolioItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:all_portfolios]
  before_action :find_portfolio, only: [:edit, :update, :destroy]


    def all_portfolios
      #code
      # this method will retrieve all portfolios from all crafters
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
      puts @portfolio_item.id
      @portfolio_item.validate
      puts @portfolio_item.inspect
      if @portfolio_item.save
        flash[:notice] = 'portfolio item successfully created'
        redirect_to crafter_path(@crafter)
      else
        flash[:alert] = 'failed to create portfolio item!'
        render 'new'
      end
    end

    def edit

    end

    def update
      @crafter = Crafter.find(params[:crafter_id])
      puts @crafter
      if (@portfolio_item.update(portfolio_params))
        flash[:notice] = 'portfolio item successfully updated'
        redirect_to crafter_path(@crafter)
      else
        flash[:alert] = 'failed to update portfolio item!'
        render 'edit'
      end
    end

    def destroy
      @crafter = Crafter.find(params[:crafter_id])
      @portfolio_item.destroy
      redirect_to crafter_path(@crafter)
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
