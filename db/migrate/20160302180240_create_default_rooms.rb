class CreateDefaultRooms < ActiveRecord::Migration
  Room.create(typ: Room::ROOMS109, price: 2200)
  Room.create(typ: Room::ROOMS110, price: 1200)
  Room.create(typ: Room::ROOMS111, price: 3200)
  Room.create(typ: Room::ROOMS112, price: 2200)
  Room.create(typ: Room::ROOMS109110, price: 3200)
  Room.create(typ: Room::ROOMSall, price: 8000)
end
