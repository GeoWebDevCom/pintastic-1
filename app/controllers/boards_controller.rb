class BoardsController < ApplicationController

  def index
    @boards = Board.paginate(page: params[:page])
  end

  def new
    @board = current_user.boards.new
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      flash[:success] = 'Your board has been created!'
      redirect_to boards_url
    else
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:name, :slug)
  end

end
