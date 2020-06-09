class TopController < ApplicationController
  def top
    @comic_boards = ComicBoard.all
  end
end
