class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname,         presence: true
  validates :email,            presence: true, uniqueness: true
  validates :password,         presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'is invalid. Include both letters and numbers' }
  validates :family_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Input full-width characters.' }
  validates :first_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Input full-width characters.' }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters' }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters' }
  validates :birthday,         presence: true

end