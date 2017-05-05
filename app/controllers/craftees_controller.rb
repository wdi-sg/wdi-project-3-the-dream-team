class CrafteesController < ApplicationController
  before_action :is_craftee_authenticated
  before_action :find_craftee, only: %i[show update destroy]
  before_action :updated_craftee_info, only: %i[create update]

    def new
      @new_craftee = Craftee.new
    end

    def edit
    end


    def show
      @craftee = find_craftee
    end

    def update
      if (@craftee.update(@form_data))
        redirect_to craftee_path(@craftee)
      else
        render 'craftee/edit'
      end
    end

    def create
      #  creating crafter will be automated by user sign up

    end

    def destroy
      #this is equivalent to deleting the user's account
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
        @form_data = params.require(:craftee).permit(:name)
      end

end
