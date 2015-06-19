Clothes Retailer

A resposive 2 page website created for a clothing company which allows them to add products to a shopping cart, add vouchers (when necessary), edit the shopping cart and  filter through categories.

Below is the product index where you can filter through the categrories and add items to your cart.

![alt tag](https://github.com/TomGroombridge/build_it/blob/master/app/assets/images/products_index(2).png)

Below is the cart where you can update quantities, remove products and add voucher codes (if applicable).

![alt tag](https://github.com/TomGroombridge/build_it/blob/master/app/assets/images/cart_page.png)


Features

	A User can browse a list of products and see their relevant information - such as availability and price.
 	A User can add a product to their cart.
 	A User can remove a product from their cart.
	A User is unable to add out of stock products to their shopping cart.
 	A User can view the total price for the products in my shopping cart.
 	A User can add a voucher to the cart if relative.
	A User can view the overall price of cart with coucher applied.

There are also discount vouchers available as follows $5.00 off your order when you spend $10.00, $10.00 off when you spend over $50.00 and $15.00 off when you spend over $75.00 and bought atleast one pair of footwear.
Development Stack

	RUBY
	JAVASCRIPT
	CSS
	HTML
	DATABASE: POSTGRES
	CSS FRAMEWORK: SEMANTIC UI
	VIEW TEMPLATES: ERB
	ISOPTOPES
	CAPYBARA
	RSPEC
	FACTORYGIRL


Getting Started

	git clone https://github.com/TomGroombridge/build_it.git
	bundle install
	rake db:migrate
	rake db:seed
	rails server

To Run Tests

	rake spec (please be patient with this, if they fail the first time execute command again, not sure why this happens.)
