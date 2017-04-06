class ListsController < ApplicationController
  before_action :set_board

  def new
    @list = List.new
  end

  def create
    @list = @board.lists.build(list_params)

    if @list.save
      redirect_to @board
    else
      render :new
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
