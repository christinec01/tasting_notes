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
    @note = Note.new(notes_params)
    @user_id = params[:user_id]
    user = current_user
    if @note.save
      user.notes << @note
    end
  end


  def entry
    # p "*" *80
    p params[:q]

    large_array_of_things = Unsplash::Photo.search("#{params[:q]}")
    # [{bla: ljaksdj, blasg: jasldf, urls: {raw: asdfj, small: THISURLISTHEONEYOUCAREABOUT}, {....}]
    # [{url: whatever the small url was }, {url: ...}]
    p ";" *80
    @images = large_array_of_things.map do |thing|
      thing["urls"]["small"]
    end
    p "0" *80
    # @images = ImageSearcher.search(query: "#{params[:q]} coffee",count: 2)[0, 3]
    # p @images
    respond_to do |format|
      format.js
    end
    # byebug
    # render json: {images: @images}, status: 200
    # redirect_to notes_new_path(:images => @images)
  end
  private
  def notes_params
    params.require(:note).permit(:name, :message, :rating)
  end
end
