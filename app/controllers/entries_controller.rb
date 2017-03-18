class EntriesController < ApplicationController
  # GET /uk-wh
  def category
    @entry = Entry.find_by(category: params[:category], level: 1)
    @entries = Entry.where(category: params[:category], level: 2).order(:sequence)
  end

  # GET /uk-wh8
  def course
    @entry = Entry.find_by(course: params[:course], level: 2)
    @entries = Entry.where(course: params[:course], level: 3).order(:sequence)
  end

  # GET /uk-wh8/4.htm
  def show
    @entry = Entry.find(params[:id])
    if params[:course] != @entry.course
      redirect_to show_entry_path(course: @entry.course, id: @entry.id), status: :moved_permanently
    else
      if @entry.xmlfile?
        render :questions
      elsif @entry.video_file?
        render :video
      elsif @entry.maps? || @entry.pictures?
        render :show
      else
        render :text
      end
    end
  end
end
