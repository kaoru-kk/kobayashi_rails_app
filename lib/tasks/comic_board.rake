namespace :comic_board do
    desc "今週の作品毎のスレッド作成"
    task :new_task => :environment do
        exist_boards = ComicBoard.where(latest_status: 1)
        if exist_boards.exists?
            exist_boards.each { |board| board.update(latest_status: 0) }
        end

        comics = Comic.where(seriazation_status: 0)
        comics.each do |comic|
            puts comic.title
            ComicBoard.create(comic_id: comic.id)
        end
    end
end
