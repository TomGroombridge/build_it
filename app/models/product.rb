class Product < ActiveRecord::Base
	has_many :order_items
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => 'shoe.png'
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
