require 'spec_helper'

describe 'removing a product' do

  before(:all) do
    create(:product)
  end

  it 'should be able to remove a item from the cart', :js => true do
    visit '/products'
    click_button("product-1")
    click_link("helllo")
    expect(page).to have_content 'Red Shoes'
    within ".order-items" do
      click_link("Remove", :match => :first)
    end
    expect(page).to have_content 'Nothing in Cart'
  end

  it "should remove one item from the cart and reduce the total by that much", :js => true do
    visit '/products'
    click_button("product-1")
    click_button("product-1")
    click_link("helllo")
    expect(page).to have_content '$21.00'
    within ".order-items" do
      click_link("Remove", :match => :first)
    end
    expect(page).to have_content '$10.50'
  end

end