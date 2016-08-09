class HomeController < ApplicationController
  def show
    @pins =
      if params[:search]
        # Find the pins where the title is like whatever value the user typed
        # This has to do with SQL. %cat = has to finish with cat and so the opposite.
        # % means anything can be there. %cat% means that it has to find whatever has cat no matter where.
        # So, where the ? is, it is gonna be replaced w the 2nd value.

        # title like ? tells rails that you are donna give it another value
        # that corresponds to %#{params[:search]}%
        Pin.where('title ilike ?', "%#{params[:search]}%").paginate(page: params[:page])
      else
        Pin.paginate(page: params[:page])
      end
  end
end
