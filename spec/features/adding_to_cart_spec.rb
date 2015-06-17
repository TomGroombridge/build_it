require 'spec_helper'

describe 'adding a product' do


  it 'should be able to add a new product' do
    visit '/products'
    expect(page).to have_content '$10.50'
  end

  it 'should be able to add the product to cart', :js => true  do
  	visit '/products'
    click_button("5-product")
    visit '/cart'
    expect(page).to have_content 'new shoes pink'
	end

end