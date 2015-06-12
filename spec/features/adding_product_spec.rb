require 'spec_helper'

describe 'adding a product' do
    it 'should be able to add a new product' do
      visit 'products/new'
      fill_in 'name', with: 'Suede Shoes, Blue'
      fill_in 'category', with: 'Women’s Footwear'
      fill_in 'price', with: '42.00'
      fill_in 'stock', with: '4'
      attach_file 'Image', Rails.root.join('spec/images/plane.jpg')
      click_button 'Create'

      expect(current_path).to eq '/products'
      expect(current_path).to have_content 'Suede Shoes, Blue'
      # expect(page).to have_css 'img.christagram-upload'
    end

end