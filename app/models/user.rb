class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]/ } 
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]/ } 
  validates :last_name_ruby, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_ruby, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  validates :password,confirmation: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_REGEX}, allow_blank: true
  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/} do
  end
end
