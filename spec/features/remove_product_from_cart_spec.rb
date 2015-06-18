require 'spec_helper'

describe 'removing a product' do

  before(:all) do
    create(:product)
    # create(:order_item)
    # create(:order)
  end

  it 'should be able to remove a item from the cart', :js => true do
    visit '/products'
    click_button("product-1")
    click_link("helllo")
    expect(page).to have_content 'Red Shoes'
    within ".remove" do
      click_link("Remove", :match => :first)
    end
    expect(page).to have_content 'Nothing in Cart'
  end

end