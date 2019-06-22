class CardController < ApplicationController
  before_action :set_card, only: %i(new create show edit update destroy)
  before_action :set_lists, only: %i(new create edit update)
  def new
    @card = Card.new(list_id: params[:list_id])
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    @list = List.find_by(id: params[:list_id])
    if @card.save
      redirect_to :root
    else
      @card.valid?
      render action: :new
    end
  end
  
  def show
    
  end
  
  def edit

  end
  def update
    if @card.update_attributes(card_params)
      redirect_to :root
    else
      @card.valid?
      render action: :edit
    end
  end
  
  def destroy
    @card.destroy
    redirect_to :root
  end
  
  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
    end
    def set_card
      @card = Card.find_by(id: params[:id])
    end
    def set_lists
      @lists = List.where(user: current_user)
    end
end
