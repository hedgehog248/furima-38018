class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :oeders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  PASSWORD_MESSAGE = 'is invalid. Include both letters and numbers'.freeze

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  NAME_MESSAGE = 'is invalid. Input full-width characters'.freeze

  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  NAME_KANA_MESSAGE = 'is invalid. Input full-width katakana characters'.freeze

  validates :password, format: { with: PASSWORD_REGEX, message: PASSWORD_MESSAGE }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: NAME_REGEX, message: NAME_MESSAGE }
    validates :first_name, format: { with: NAME_REGEX, message: NAME_MESSAGE }
    validates :last_name_kana, format: { with: NAME_KANA_REGEX, message: NAME_KANA_MESSAGE }
    validates :first_name_kana, format: { with: NAME_KANA_REGEX, message: NAME_KANA_MESSAGE }
    validates :birthday
  end
end
