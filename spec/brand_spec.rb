require 'spec_helper'

describe 'Brand' do
  describe '#save' do
    it 'does not create brand if no input for name is present' do
      brand = Brand.new({name: '', price: 100})
      expect(brand.save).to(eq(false))
    end
    it 'does not create brand if no input for price is present' do
      brand = Brand.new({name: 'brand', price: nil})
      expect(brand.save).to(eq(false))
    end
    it 'does not allow brand name to be more than 100 characters' do
      brand = Brand.new({name: 'brandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrand', price: 100})
      expect(brand.save).to(eq(false))
    end
    it 'does not allow duplicate brands' do
      Brand.create({name: 'brand', price: 100})
      brand = Brand.new({name: brand, price: 100})
      expect(brand.save).to(eq(false))
    end
  end
  describe '#capitalize_brand' do
    it 'capitalizes each word in brand name before saving' do
      brand = Brand.create({name: 'big brand', price: 100})
      expect(brand.name).to(eq('Big Brand'))
    end
  end
end
