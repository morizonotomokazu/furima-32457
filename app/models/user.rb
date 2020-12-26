class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  #  has_many :orders
  with_options presence: true do
    validates :nickname                 
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :first_name ,:last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/}
    validates :first_name_kana,:last_name_kana ,format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
end 
