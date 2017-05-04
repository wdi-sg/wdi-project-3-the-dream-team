class CrafteesController < ApplicationController
  before_action :find_craftee, only: %i[show edit update destroy]

    def show
      @craftee =  find_craftee
    end

    def edit
      @craftee = find_craftee
    end

    def update
      @updated_craftee = find_craftee
      if (@updated_craftee.update(craftee_params))
        redirect_to flights_path
      else
        render 'edit'
      end
    end

    def create
      #  @craftee = Craftee.create
      #  if @craftee.save
      #    redirect_to craftee_path(@craftee)
      # else
      #   render 'new'
      # end
      
    end

    def destroy
      find_craftee.destroy
      redirect_to craftees_path
    end

    private

      def find_craftee
        @craftee = Craftee.find(params[:id])
      end

end
