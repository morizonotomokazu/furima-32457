class Credit
  include ActiveModel::Model
  attr_accessor :postal_code,:city,:house_number,:building_name,:phone_number,:prefecture_id,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city,format: { with: /\A[ぁ-ん一-龥々]+\z/}
    validates :house_number,format:{with:/\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :phone_number, format: { with: /\A[0-9]+\z/ },length: { maximum: 11 },numericality: { only_integer: true }
    validates :user_id
    validates :item_id
    validates :prefecture_id,numericality: { other_than: 1 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
end
