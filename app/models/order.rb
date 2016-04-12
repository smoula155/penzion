class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :room_id, presence: true
  validate :val_price
  validate :val_from_date


  scope :for_user, ->(user_id){where user_id: user_id}
  scope :from_date, ->(from_date){where 'from_date <= ?',from_date}
  scope :to_date, ->(to_date){where 'to_date > ?',to_date}
  scope :form_room, ->(room_id){where 'room_id = (?) OR room_id = 6',room_id}
  scope :form_bottom, ->(room_id){where 'room_id = (?) OR room_id = 5',room_id}
  scope :form_all_bottom_rooms, ->{where 'room_id = 1 OR room_id = 2 OR room_id = 6 OR room_id = 5'}
  scope :this_year, ->{where 'created_at < (?) AND created_at > (?)',Date.today + 365,  Date.today - 365}


  STATUS_NEW = 1
  STATUS_ELABORATED = 2
  STATUS_FINISHED = 3
  STATUS_REJECTED = 4
  STATUS_STORNO = 5

  TYPE_STATUS = [['Nová objednávka',STATUS_NEW],['Čeká na zaplacení', STATUS_ELABORATED],['Uzavřená', STATUS_FINISHED],['Zamítnutá', STATUS_REJECTED], ['Stornovaná', STATUS_STORNO]]

  def generate_var_symbol
    count =  Order.this_year.count
    if count < 10
      Date.today.year.to_s  + '000'+ count.to_s
    elsif count < 100
      Date.today.year.to_s  + '00' + count.to_s
    elsif count < 1000
      Date.today.year.to_s  + '0' + count.to_s
    else
      Date.today.year.to_s  + count.to_s
    end
  end

  def start_time
    self.from_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  private
  	def val_price
  		if !price.present? || price < 0
      		errors.add(:price, "Zadaná špatná výsledná cena")
    	end
  	end

    def val_from_date
      errors.add(:from_date, "Datum musí být minimálně dnešní") if from_date < Date.today
    end
end
