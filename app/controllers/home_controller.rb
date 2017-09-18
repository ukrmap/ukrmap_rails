class HomeController < ApplicationController
  def autocomplete
    render json: Term.where("name LIKE ? AND entries_count > ?" , "#{params[:query]}%", 1).order('popularity DESC').limit(10)
  end
  # GET /
  def index
    if params[:q]
      @entries = Entry.search(params[:q])
      Term.log_query(params[:q], @entries.count)
      render :search
    else
      render :index
    end
  end
end
