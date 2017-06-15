# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Price =
  price_for_day: (type_rooms) ->
    switch type_rooms
      when "1" then 2000.0
      when "2" then 1200
      when "3" then 2400
      when "4" then 2000
      when "5" then 2800
      when "6" then 7200
  price_for_time: (count,type_rooms) ->
    number = @price_for_day(type_rooms) * count
    if count > 5
      number = procent(number,20)
    else
      if count > 2
        number = procent(number,10)
    number
  price_for_time_show: (count,type_rooms) ->
    number = @price_for_time(count,type_rooms)
    number_to_currency(number)


procent = (number,proc) ->
  one = number / 100
  number - one * proc

parse_date = (date) ->
  dateParts = date.split("/")
  date = new Date((dateParts[0]),(dateParts[1] - 1),dateParts[2])

betwen_date = (date_from, date_to) ->
  DAY = 1000 * 60 * 60  * 24
  date_to = parse_date(date_to)
  date_from = parse_date(date_from)
  days_passed = Math.round((date_to.getTime() - date_from.getTime()) / DAY)

number_to_currency = (number) ->
  try
    precision =  2
    unit = 'Kč'
    separator = if precision > 0 then  '.' else ''
    delimiter =  ' '
    parts = parseFloat(number).toFixed(precision).split('.')
    number_with_delimiter(parts[0], delimiter) + separator + parts[1].toString() + unit
  catch e
    number

number_with_delimiter = (number) ->
  try
    delimiter =  ' '
    separator =  '.'
    parts = number.toString().split('.')
    parts[0] = parts[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1' + delimiter)
    parts.join(separator)
  catch e
    number


change_price = () ->

  from_date = $('#order_from_date').val()
  to_date = $('#order_to_date').val()
  type_rooms = $('#order_room_id').val()
  betwen = betwen_date(from_date,to_date)
  if betwen > 0
    $('.order_price_new').val(Price.price_for_time(betwen, type_rooms))
    $('#price_show').val(Price.price_for_time_show(betwen, type_rooms))
  else
    $('#price_show').val("Vyberte jinný rozsah datumů")
    $('.order_price_new').val("Vyberte jinný rozsah datumů")


#fix kvuli turbolinku
ready = ->
    $('#order_room_id').change -> change_price();
    $('#order_from_date').change -> change_price();
    $('#order_to_date').change -> change_price();


$(document).ready(ready)
$(document).on('page:load', ready)
