require('rspec')
require('parcels')

describe('Parcel') do
  describe('#volume')  do
    it('calculates the volume of the box by finding the product of the side lengths') do
      test_parcel = Parcel.new(4,5,6,10,'next day')
      expect(test_parcel.volume()).to(eq(120))
    end
  end
end
