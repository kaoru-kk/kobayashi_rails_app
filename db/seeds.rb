Comic.create(
    title: "チェンソーマン",
    author: "藤本タツキ",
    overview: "「悪魔」と呼ばれる存在が日常に蔓延る世界。少年デンジと「チェンソーの悪魔」のポチタは、死別した父親の借金を返すため、悪魔を駆除する「デビルハンター」を主な仕事としながらなんとか生計を立てていた。ある日デンジは、仕事を斡旋していたヤクザに騙され、「ゾンビの悪魔」によってポチタと共に殺害されてしまう。しかし、ポチタはデンジの血を飲んだことで蘇生し、デンジの身体を修復するためデンジの心臓となる。復活したデンジは「チェンソーの悪魔」へと変身する力を手に入れ、ゾンビの集団を一掃する。撃退に成功したデンジは現場に駆け付けた公安のデビルハンターであるマキマに導かれ、その身を公安によって管理されることになる。",
    seriazation_status: "連載中"
)
Comic.create(
    title: "ハイキュー",
    author: "古館春一",
    overview: "バレーする漫画",
    seriazation_status: "連載中"
)
Comic.create(
    title: "ONE PIECE",
    author: "尾田栄一郎",
    overview: "海賊漫画",
    seriazation_status: "連載中"
)
Comic.create(
    title: "約束のネバーランド",
    author: "白井カイウ",
    overview: "脱獄する幼児",
    seriazation_status: "連載中"
)
Comic.create(
    title: "僕のヒーローアカデミア",
    author: "堀越耕平",
    overview: "ヒーロー漫画",
    seriazation_status: "連載中"
)
Comic.create(
    title: "Dr.STONE",
    author: "稲垣理一郎",
    overview: "科学漫画",
    seriazation_status: "連載中"
)
Comic.create(
    title: "ブラッククローバー",
    author: "田畠祐基",
    overview: "魔法漫画",
    seriazation_status: "連載中"
)
Comic.create(
    title: "タイトルA",
    author: "AAA",
    overview: "AAA",
    seriazation_status: "連載中"
)

Comic.create(
    title: "タイトルB",
    author: "BBB",
    overview: "BBB",
    seriazation_status: "連載中"
)
Comic.create(
    title: "タイトルC",
    author: "CCC",
    overview: "CCC",
    seriazation_status: "連載中"
)
Comic.create(
    title: "タイトルD",
    author: "DDD",
    overview: "DDD",
    seriazation_status: "連載中"
)
Comic.create(
    title: "タイトルE",
    author: "EEE",
    overview: "EEE",
    seriazation_status: "連載中"
)

Comic.create(
    title: "タイトルF",
    author: "FFF",
    overview: "FFF",
    seriazation_status: "連載終了"
)
Comic.create(
    title: "タイトルGGG",
    author: "GGG",
    overview: "GGG",
    seriazation_status: "休載中"
)

comics = Comic.where(seriazation_status: 0)
comics.each do |comic|
    ComicBoard.create(comic_id: comic.id)
end

User.create(name:"タロー", email: "d@d", password: "aaaaaa")
User.create(name:"ミズゴロウ", email: "a@a", password: "bbbbbb")
Comment.create(user_id:1, comic_board_id:1, comment_text: "超面白い！！！！" )
Comment.create(user_id:2, comic_board_id:1, parent_id:1,  comment_text: "わっかる！" )

Point.create(title: "過去ログインボーナス1", detail: "06/01-06/07", point: 100,	start_date: "2020-06-01 00:00:00", end_date: "2020-06-07 23:59:00", point_category: "ログインボーナス")
Point.create(title: "過去ログインボーナス2", detail: "06/08-06/15", point: 100,	start_date: "2020-06-08 00:00:00", end_date: "2020-06-14 23:59:00", point_category: "ログインボーナス")
Point.create(title: "過去ログインボーナス2", detail: "06/15-06/22", point: 100,	start_date: "2020-06-15 00:00:00", end_date: "2020-06-21 23:59:00", point_category: "ログインボーナス")
Point.create(title: "ハロウィンボーナス", detail: "ハロウィン！06/15-06/22", point: 300, start_date: "2020-08-30 00:00:00", end_date: "2020-08-31 23:59:00", point_category: "シーズンイベント")