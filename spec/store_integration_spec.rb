require 'spec_helper'

describe 'the home page', { type: :feature } do
  it 'goes to home page' do
    visit('/')
    expect(page).to have_content('Shoe Brands and Stores Finder')
  end
end
describe 'the brands page', { type: :feature } do
  it 'goes to brands page' do
    visit('/brands')
    expect(page).to have_content('Brands')
  end
end
describe 'the stores page', { type: :feature } do
  it 'goes to stores page' do
    visit('/stores')
    expect(page).to have_content('Stores')
  end
end
describe 'the add brands page', { type: :feature } do
  it 'goes to adds brands page' do
    visit('/add_brand')
    expect(page).to have_content('Add Brand')
  end
end
describe 'the add stores page', { type: :feature } do
  it 'goes to adds stores page' do
    visit('/add_store')
    expect(page).to have_content('Add Store')
  end
end
describe 'brands', {type: :feature} do
  it 'will show brands' do
    Brand.create({name: 'brand1', price: 100})
    visit '/brands'
    expect(page).to have_content('Brand1')
  end
  it 'will add brands from form' do
    visit '/add_brand'
    fill_in 'name', with: 'brand1'
    fill_in 'price', with: '100'
    click_button 'Add Brand'
    expect(page).to have_content('Brand1')
  end
end
describe 'stores', {type: :feature} do
  it 'will show stores' do
    Store.create({name: 'store1'})
    visit '/stores'
    expect(page).to have_content('Store1')
  end
  it 'will add stores from form' do
    visit '/add_store'
    fill_in 'name', with: 'store1'
    click_button 'Add Store'
    expect(page).to have_content('Store1')
  end
  it 'will edit stores' do
    visit '/add_store'
    fill_in 'name', with: 'store1'
    click_button 'Add Store'
    click_link 'Store1'
    fill_in 'name', with: 'store2'
    click_button 'Edit Store'
    expect(page).to have_content('Store2')
  end
end
