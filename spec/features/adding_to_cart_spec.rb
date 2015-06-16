require 'spec_helper'

describe 'adding a product' do

	before do
		create(:product)
	end

  it 'should be able to add a new product' do
    visit '/products'
    expect(page).to have_content '$10.50'
  end



  it 'should be able to add the product to cart' do
  	visit '/products'
  	click_button 'courseSubmit'
	end

end