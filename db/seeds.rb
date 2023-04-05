# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

location = Location.create(name: 'Bnagalore', address: '185, Brigade Road', city: 'Bengalore', state: 'Karnataka', zipcode: '560100')
restaurant = location.restaurants.create(name: 'Global Barbeque', desc: 'Healthy and tasty food', phone: '9098767656')

category_1 = restaurant.categories.create(name: 'South Indian', desc: 'South Indian cuisines', no_of_items: '10')
category_2 = restaurant.categories.create(name: 'Chinese', desc: 'Chinese cusines', no_of_items: '10')

product_1 = category_1.products.create(name: 'Chicken Briyani', desc: 'Protein rich food', unit_price: '250', tax_percent: 10, bogo: true)
category_1.products.create(name: 'Raita', desc: 'Side dish', unit_price: '50', tax_percent: 2, free_product_id: product_1.id)
category_1.products.create(name: 'Mutton curry', desc: 'Healthy mutton', unit_price: '500', tax_percent: 5)

category_2.products.create(name: 'Noodles', desc: 'Yummy noodles', unit_price: '100', tax_percent: 6)
product_2 = category_2.products.create(name: 'Chicken Tandoori', desc: 'Tasty chicken', unit_price: '300', tax_percent: 7.5, bogo: true)
category_1.products.create(name: 'Mayonnaise', desc: 'Side dish', unit_price: '75', tax_percent: 2.5, free_product_id: product_2.id)

