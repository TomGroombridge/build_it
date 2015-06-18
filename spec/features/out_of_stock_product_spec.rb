require 'spec_helper'

describe 'removing a product' do

  before(:all) do
    @voucher = FactoryGirl.create(:product, name: "Red Shoes", category: "Shoes", price: 10.50, stock: 0)
  end

  it 'should say out "out of stock" if there is no stock' do
    visit '/products'
    expect(page).to have_content 'out of stock'
  end


end