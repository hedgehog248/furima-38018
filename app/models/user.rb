class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_MESSAGE = "には英字と数字の両方を含めて設定してください"

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  NAME_MESSAGE = "には全角（漢字・ひらがな・カタカナ）を使用してください"

  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  NAME_KANA_MESSAGE = "には全角カタカナを使用してください"

  validates :password, format: {with: PASSWORD_REGEX, message: PASSWORD_MESSAGE}
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: NAME_REGEX, message: NAME_MESSAGE }
  validates :first_name, presence: true, format: { with: NAME_REGEX, message: NAME_MESSAGE }
  validates :last_name_kana, presence: true, format: { with: NAME_KANA_REGEX, message: NAME_KANA_MESSAGE }
  validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX, message: NAME_KANA_MESSAGE }
  validates :birthday, presence: true
end
