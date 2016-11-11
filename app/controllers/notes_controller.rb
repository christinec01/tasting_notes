class NotesController < ApplicationController

  # def index
  #   @user = User.find(params[:user_id])
  # end

  def new
    p params[:user_id]
    p "*" *80
    @images = params[:images] || []
    respond_to do |format|
      format.js
    end
    #   format.html{}
    #   format.json
  end

  def create
    p "*"*80
    @note = Note.new(notes_params)
    @user_id = params[:user_id]
    user = current_user
    if @note.save
      user.notes << @note
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
    params.require(:note).permit(:name, :message, :rating)
  end
end
