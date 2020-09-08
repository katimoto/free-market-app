class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthdate
    validates :email,    uniqueness: {case_sensitive: false},
                         format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

    with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} do
      validates :password, length: {minimum: 6}
    end
       
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'} do
      validates :first_name
      validates :last_name
    end
       
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください'} do
      validates :f_kana
      validates :l_kana
    end
  end

  has_many :items
  
end
