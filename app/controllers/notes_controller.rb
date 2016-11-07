class NotesController < ApplicationController
  def new
    @images = params[:images] || []

  end

  def entry
    @images = ImageSearcher.search(query: "#{params[:q]} coffee",count: 2)[0, 3]
    # byebug
    # render json: {images: @images}, status: 200
    redirect_to notes_new_path(:images => @images)
  end
end
