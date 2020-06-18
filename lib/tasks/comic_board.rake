namespace :comic_board do
    desc "今週の作品毎のスレッド作成"
    task :new_task => :environment do

        #実行する処理が祝日の場合中断する
        if ComicBoardsHelper.today_is_holiday? != nil
            exit!
        end

        ActiveRecord::Base.transaction do
            #現在、最新のスレッドを取得→ステータスをNOT最新に変更
            exist_boards = ComicBoard.where(latest_status: 1)
            if exist_boards.exists?
                exist_boards.update_all(latest_status: 0)
            end
            puts "既存のボードのステータスを変更完了！"

            #現在連載中の漫画を取得→最新のスレッド作成
            comics = Comic.where(seriazation_status: "連載中")
            comics_array = []
            comics.find_each do |comic|
                comics_array << ComicBoard.new(comic_id: comic.id)
            end
            ComicBoard.import comics_array
            puts "最新のスレッド作成完了！"

            #ログインボーナスを作成
            Point.create(title: "ログイン ボーナス", detail: "これはログインボーナスだよん", point: 100, start_date: Time.now , end_date: Time.now.next_week, point_category: "ログインボーナス")
            puts "最新のログインボーナス作成完了！"
            
            puts Time.now
            puts "全処理完了"

        end
        rescue => e
           puts e
    end
end
