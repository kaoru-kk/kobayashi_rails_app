- `rails db:seed`をお忘れなく


- `rails comic_board:new_task`で、最新のスレッドを立てることができます
（以下コード）

```
#lib/tasks/commic_board.rb

namespace :comic_board do
    desc "今週の作品毎のスレッド作成"
    task :new_task => :environment do
        #現在、最新のスレッドを取得→ステータスをNOT最新に変更
        exist_boards = ComicBoard.where(latest_status: 1)
        if exist_boards.exists?
            exist_boards.each { |board| board.update(latest_status: 0) }
        end

        #現在連載中の漫画を取得→最新のスレッド作成
        comics = Comic.where(seriazation_status: 0)
        comics.each do |comic|
            puts comic.title
            ComicBoard.create(comic_id: comic.id)
        end
    end
end
```
