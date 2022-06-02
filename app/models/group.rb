class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :schedules, dependent: :destroy
end
