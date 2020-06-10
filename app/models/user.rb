class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :favorites

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
