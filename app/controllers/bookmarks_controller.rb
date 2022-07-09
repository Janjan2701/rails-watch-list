class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show

  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark.list
    else
      render :new
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
  end


  def update
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
