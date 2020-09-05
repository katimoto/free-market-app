class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email,    uniqueness: {case_sensitive: false},
                         format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password, length: {minimum: 6}
       
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '全角文字を使用してください'} do
      validates :first_name
      validates :last_name
    end
       
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください'} do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
