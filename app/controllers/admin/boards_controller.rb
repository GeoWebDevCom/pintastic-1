class Admin::BoardsController < Admin::BaseController

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end


  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = 'Your board has been created!'
      redirect_to admin_boards_url
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      flash[:success] = 'Your board has been updated!'
      redirect_to admin_boards_url
    else
      render :edit
    end
  end


  private

  def board_params
    # We require the params to have a board and we permit it to have a name and a slug
    params.require(:board).permit(:name, :slug)
  end

end
