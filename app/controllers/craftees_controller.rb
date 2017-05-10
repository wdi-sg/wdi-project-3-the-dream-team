class CrafteesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_craftee_authenticated, only: %i[update]
  before_action :find_craftee, only: %i[show edit update destroy]
  before_action :updated_craftee_info, only: %i[create update]

    def new
      @new_craftee = Craftee.new
    end

    def edit
    end


    def show
    end

    def update
      if @craftee.update(updated_craftee_info)
        redirect_to craftee_path(@craftee)
      else
        render 'craftee/edit'
    end
  end

    def create
      #  creating craftee will be automated by user Register

      # @craftee = Craftee.new(updated_craftee_info)
      # @craftee.user_id = current_user.id
      # puts "This is in the controller #{@craftee}"
      # if @craftee.save
      #   redirect_to craftee_path(@craftee)
      # else
      #   render 'craftee/edit'
      # end
    end

    def destroy
      if(@craftee.destroy)
        redirect_to root
      else
        render craftee_path
      end
    end

    private

      def find_craftee
        @craftee = Craftee.find(params[:id])
      end

      def updated_craftee_info
        params.require(:craftee).permit(:name)
      end

end
