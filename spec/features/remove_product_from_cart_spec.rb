require 'spec_helper'

describe 'removing a product' do

  before(:all) do
    create(:product)
    # create(:order_item)
    # create(:order)
  end

  it 'should be able to remove a order item', :js => true do
  	visit '/products'
    click_button("product-1")
    click_link("helllo")
    # click_link("Remove")
    # click_link('id-of-link')
    # first('#order_item').click_link('Remove')
    expect(page).to have_content 'Red Shoes'
    within ".remove" do
      click_link("Remove", :match => :first)
    end
    expect(page).to have_content 'Nothing in Cart'
	end

end