class Parcel
  @@all_parcels = []

  define_singleton_method(:all) do
    @@all_parcels
  end

  define_method(:initialize) do |length, width, height, weight, delivery|
    @length = length
    @width = width
    @height = height
    @weight = weight
    @delivery = delivery
    @current_month = Time.new().month()
  end

  define_method(:save) do
    @@all_parcels.push(self)
  end

  define_method(:volume) do
    @length.*(@width).*(@height)
  end

  define_method(:discount) do
    discount_months = [4,5]
    discount = 0
    if discount_months.include?(@current_month)
      discount = 0.1
    end
    discount
  end

  define_method(:cost) do
    cost_array = []
    volume = volume()
    cost = 0
    if @delivery.==('ground')
      cost_array.push(2)
    elsif @delivery.==('2 day')
      cost_array.push(3)
    elsif @delivery.==('next day')
      cost_array.push(5)
    end

    if volume.<=(250)
      cost_array.push(0)
    elsif volume.<=(500)
      cost_array.push(1)
    else
      cost_array.push(3)
    end

    if @weight.<=(50)
      cost_array.push(0)
    else
      cost_array.push((@weight.-(50)).*(0.50))
    end

    cost_array.each() do |price|
      cost += price
    end

    cost *= (1.-(discount()))

    "$".+(cost.round(2).to_s).+('0')
  end
end
