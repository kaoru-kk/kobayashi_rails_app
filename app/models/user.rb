class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :favorites

  #受け取ったポイント
  has_many :recieve_points, class_name: "PointReciever", foreign_key: "user_id", dependent: :destroy

  #自分からの通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  #相手からの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  #ユーザとフォローする人のリレーション
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  #ユーザとフォローされる人のリレーション
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  #自分がフォローしているユーザ取得のため
  has_many :following_user, through: :follower, source: :followed
  #自分がフォローされているユーザ取得のため
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  #ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  def favorite_exists?(comment)
    favorites.where(comment_id: comment).exists?
  end
end
