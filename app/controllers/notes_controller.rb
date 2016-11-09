class NotesController < ApplicationController
  def new
    p params
    @images = params[:images] || []
    # respond_to do |format|
    #   format.js {}
    #   format.html{}
    #   format.json
    # end
  end

  def entry
    @images = ImageSearcher.search(query: "#{params[:q]} coffee",count: 2)[0, 3]
    respond_to do |format|
      format.js
    end
    # byebug
    # render json: {images: @images}, status: 200
    # redirect_to notes_new_path(:images => @images)
  end
end
