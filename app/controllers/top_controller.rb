class TopController < ApplicationController
  def top
    @comic_boards = ComicBoard.where(latest_status: 1)
  end
end
