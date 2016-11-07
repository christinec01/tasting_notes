class NotesController < ApplicationController

  def new
  end

  def search
    @images = ImageSearcher.search(query: "#{params[:q]}")
    # byebug
    render :search
  end
end
