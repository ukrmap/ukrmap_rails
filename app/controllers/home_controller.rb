class HomeController < ApplicationController
  # GET /
  def index
    if params[:q]
      @entries = Entry.search(params[:q])
      @terms = Term.log_query(params[:q], @entries.count)
      render :search
    else
      render :index
    end
  end
end
