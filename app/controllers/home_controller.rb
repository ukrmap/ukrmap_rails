class HomeController < ApplicationController
  # GET /
  def index
    if params[:q]
      @entries = Entry.search(params[:q])
      render :search
    else
      render :index
    end
  end
end
