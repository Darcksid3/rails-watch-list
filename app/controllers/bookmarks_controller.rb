class BookmarksController < ApplicationController

    def new
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new
    end

    def create
        @list = List.find(params[:list_id])
        
    end

    private

    def set_bookmark
        @bookmark = Bookmark.find(params(:id))
    end

    def params_bookmark
        params.require(:bookmark).permit(:comment)
    end
end
