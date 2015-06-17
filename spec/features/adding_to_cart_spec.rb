require 'spec_helper'

describe 'adding a product' do

  before do
    create(:product)
  end


  it 'should be able to add a new product' do
    visit '/products'
    expect(page).to have_content '$10.50'
  end

  it 'should be able to add the product to cart', :js => true do
  	visit '/products'
    # click_button("product-1")
    # page.find("#product-1").click
    # visit '/cart'
    expect(page).to have_content 'Red Shoes'
	end

end