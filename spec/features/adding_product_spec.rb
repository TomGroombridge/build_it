require 'spec_helper'

describe 'adding a product' do
  it 'should be able to add a new product' do
    visit 'products/new'
    fill_in 'Name', with: 'Suede Shoes, Blue'
    fill_in 'Category', with: 'Women’s Footwear'
    fill_in 'Price', with: '42.00'
    fill_in 'Stock', with: '4'
    click_button 'Create Product'
    expect(current_path).to eq '/products'
    expect(page).to have_content 'Suede Shoes, Blue'
  end

end