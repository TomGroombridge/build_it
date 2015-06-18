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
    # find("option[value='1']").click
    select "$5.00", :from => "order_voucher_id"
    expect(page).to have_content 'Nothing in Cart'
  end

end