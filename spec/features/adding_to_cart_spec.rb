require 'spec_helper'

describe 'adding a product' do

  before(:all) do
    create(:product)
    # create(:order_item)
  end


  it 'should be able to add a new product' do
    visit '/products'
    expect(page).to have_content '$10.50'
  end

  it 'should be able to add the product to cart', :js => true do
  	visit '/products'
    click_button("product-1")
    click_link("helllo")
    expect(page).to have_content 'Red Shoes'
	end

end