class HomeController < ApplicationController
  def autocomplete
    @terms = Term.where("name LIKE ? AND entries_count > 0", "#{params[:query]}%").order('popularity DESC').limit(10)
    render json: { suggestions: @terms.pluck(:name) }
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
