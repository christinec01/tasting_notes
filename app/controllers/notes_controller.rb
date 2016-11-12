class NotesController < ApplicationController

  
  def index
    @notes = current_user.notes
  end

  def new
    @images = params[:images] || []
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @user = current_user
    @note = current_user.notes.build(notes_params)
    if @note.save
      respond_to do |format|
        format.js
      end
    end
  end

  def entry
    large_array_of_things = Unsplash::Photo.search("#{params[:q]}")
      @images = large_array_of_things.map do |thing|
        thing["urls"]["small"]
      end
    respond_to do |format|
      format.js
    end
  end

  private
  def notes_params
    params.permit(:name, :message, :rating)
  end
end
