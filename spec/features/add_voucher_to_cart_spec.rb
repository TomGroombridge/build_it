require 'spec_helper'

describe 'adding a voucher' do

  before(:all) do
    create(:product)
    create(:voucher)
  end

  it 'should be able to add a voucher code to a order of $10', :js => true do
    visit '/products'
    click_button("product-1")
    click_link("helllo")
    select "$5.00", :from => "order_voucher_id"
    click_button("add-voucher")
    expect(page).to have_content '$5.50'
  end

end