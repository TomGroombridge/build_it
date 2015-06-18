require 'spec_helper'

describe 'adding a product' do

  before(:all) do
    create(:product)
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

  it "add extra quantity to a order item", :js => true do
    visit '/products'
    click_button("product-1")
    click_link("helllo")
    within ".order-items" do
      fill_in('order_item_quantity', with: 3, :match => :first)
    end
    within ".order-items" do
      click_button("update_quantity", :match => :first)
    end
    expect(page).to have_content '$31.50'
  end

end