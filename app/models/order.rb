class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :room_id, presence: true
  validate :val_price


  scope :for_user, ->(user_id){where user_id: user_id}
  scope :from_date, ->(from_date){where 'from_date <= ?',from_date}
  scope :to_date, ->(to_date){where 'to_date > ?',to_date}
  scope :form_room, ->(room_id){where room_id: room_id}
  scope :form_all_bottom_rooms, ->{where 'room_id = 1 OR room_id = 2'}
  scope :form_all_rooms, ->{where 'room_id IN (?)', Room::ONE_ROOMS}

  private
  	def val_price
  		unless price.present? && price > 0
      		errors.add(:price, "Zadaná špatná výsledná cena")
    	end
  	end
end