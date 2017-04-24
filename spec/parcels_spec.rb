require('rspec')
require('parcels')

describe('Parcel') do
  describe('#volume')  do
    it('calculates the volume of the box by finding the product of the side lengths') do
      test_parcel = Parcel.new(4,5,6,10,'next day')
      expect(test_parcel.volume()).to(eq(120))
    end
  end

  describe('#discount') do
    it('calculates a discount based on the current month') do
      test_parcel = Parcel.new(4,5,6,10,'next day')
      expect(test_parcel.discount()).to(eq(0.1))
    end
  end

  describe('#cost') do
    it('calculates the cost of shipping the box') do
      test_parcel = Parcel.new(4,5,6,10,'next day')
      expect(test_parcel.cost()).to(eq('$4.50'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Parcel.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves each parcel to the all parcels array') do
      test_parcel = Parcel.new(4,5,6,10,'next day')
      test_parcel.save()
      expect(Parcel.all()).to(eq([test_parcel]))
    end
  end


end
