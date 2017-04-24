class CardsController < ApplicationController
  before_action :set_list

  def create
    @card = @list.cards.build(card_params)

    if @card.save
      redirect_to @list.board
    else
      head :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def card_params
    params.require(:card).permit(:title)
  end
end
