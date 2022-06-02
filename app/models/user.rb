class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # スケジュールとのアソシエーション
  has_many :schedules, dependent: :destroy
  # グループ作成のアソシエーション
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users, dependent: :destroy
  # グループチャットのアソシエーション
  has_many :chats, dependent: :destroy

  # 自分がフォローする
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローしている人を取得
  has_many :followings, through: :relationships, source: :followed
  # 自分がフォローされる
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分のフォロワーを取得
  has_many :followers, through: :reverse_of_relationships, source: :follower
end
