class BookmarksController < ApplicationController

    def new
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new
    end

    def create
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new(params_bookmark)
        @bookmark.list = @list
        if @bookmark.save
            redirect_to list_path(@list)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @bookmark = set_bookmark
        @bookmark.destroy
        redirect_to lists_path, status: :see_other
    end

    private

    def set_bookmark
        @bookmark = Bookmark.find(params[:id])
    end

    def params_bookmark
        params.require(:bookmark).permit(:comment, :movie_id)
    end
end
