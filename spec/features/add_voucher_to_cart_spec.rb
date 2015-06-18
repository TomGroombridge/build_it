require 'spec_helper'

describe 'adding a voucher' do

  before(:all) do
    create(:product)
    create(:voucher)
    @voucher = FactoryGirl.create(:voucher, price_of_activation: 50.00, :price => 10.00)
    @voucher = FactoryGirl.create(:voucher, price_of_activation: 75.00, :price => 15.00, :category => "footwear")
  end

  it 'should be able to add a voucher code to a order of $10', :js => true do
    visit '/products'
    click_button("product-1")
    click_link("helllo")
    select "$5.00", :from => "order_voucher_id"
    click_button("add-voucher")
    expect(page).to have_content '$5.50'
  end

  it 'should be able to add a voucher code to a order of $50', :js => true do
    visit '/products'
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_link("helllo")
    select "$10.00", :from => "order_voucher_id"
    click_button("add-voucher")
    expect(page).to have_content '$42.50'
  end

  it 'should be able to add a voucher code to a order of $10', :js => true do
    visit '/products'
    click_button("product-1")
    click_link("helllo")
    select "$5.00", :from => "order_voucher_id"
    click_button("add-voucher")
    expect(page).to have_content '$5.50'
  end

  it "should be able to add voucher when footwear category is in cart and over $75", :js => true do
    visit '/products'
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_button("product-1")
    click_link("helllo")
    select "$15.00", :from => "order_voucher_id"
    click_button("add-voucher")
    expect(page).to have_content '$69.00'
  end

end