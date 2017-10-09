require 'spec_helper'

describe 'Store' do
  describe '#save' do
    it 'does not create store if no input for name is present' do
      store = Store.new({name: ''})
      expect(store.save).to(eq(false))
    end
    it 'does not allow store name to be more than 100 characters' do
      store = Store.new({name: 'storestorestorestorestorestorestorestorestorestorestorestorestorestorestorestorestorestorestorestore'})
      expect(store.save).to(eq(false))
    end
    it 'does not allow duplicate stores' do
      Store.create({name: 'store'})
      store = Store.new({name: 'store'})
      expect(store.save).to(eq(false))
    end
  end
  describe '#capitalize_store' do
    it 'capitalizes each word in store name before saving' do
      store = Store.create({name: 'big store'})
      expect(store.name).to(eq('Big Store'))
    end
  end
end
