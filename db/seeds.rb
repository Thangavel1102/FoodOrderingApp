# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

location = Location.create(name: 'Bnagalore', address: '185, Brigade Road', city: 'Bengalore', state: 'Karnataka', zipcode: '560100')
restaurant = location.restaurants.create(name: 'Global Barbeque', desc: 'Healthy and tasty food', phone: '9098767656')
category_1 = restaurant.categories.create(name: 'South Indian', desc: 'South Indian cuisines', no_of_items: '10')
category_2 = restaurant.categories.create(name: 'Chinese', desc: 'Chinese cusines', no_of_items: '10')
category_1.products.create(name: 'Chicken curry', desc: 'Protein rich food', unit_price: '250')
category_1.products.create(name: 'Mutton curry', desc: 'Healthy mutton', unit_price: '500')
category_2.products.create(name: 'Noodles', desc: 'Yummy noodles', unit_price: '100')
category_2.products.create(name: 'Chicken Tandoori', desc: 'Tasty chicken', unit_price: '300')
