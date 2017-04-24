class Parcel
  define_method(:initialize) do |length, width, height, weight, delivery|
    @length = length
    @width = width
    @height = height
    @weight = weight
    @delivery = delivery
  end

  define_method(:volume) do
    @length.*(@width).*(@height)
  end
end
