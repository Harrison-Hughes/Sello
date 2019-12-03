user1 = User.create(name: "Seed seller", email: "seed@email", password_digest: "password")
user2 = User.create(name: "Seed buyer", email: "seed@email", password_digest: "password")

product1 = Product.create(name: "Winter Wreath", description: "Wooden Snowflake Monogram", created_at: Time.now, price: 10, stock_count: 6, user_id: user1.id, img_url: "https://i.etsystatic.com/12765667/r/il/e1f6e1/1065416782/il_1588xN.1065416782_hxkl.jpg")
product2 = Product.create(name: "Christmas Red", description: "Christmas Personalized Red", created_at: Time.now, price: 8, stock_count: 10, user_id: user1.id, img_url: "https://i.etsystatic.com/8796630/r/il/40b74a/2079684350/il_1588xN.2079684350_cm5x.jpg")
product3 = Product.create(name: "Christamas", description: "Handmade Christams Balls", created_at: Time.now, price: 20, stock_count: 5, user_id: user1.id, img_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/9-Pack-Glass-Jewel-Tone-Baubles-2/PL_05_T40_8783P_XT_X_EC_0?$PDP_INT_IMAGEGRID_1_LG$")

tag1 = Tag.create(name: "handmade")
tag2 = Tag.create(name: "ceramic")
tag3 = Tag.create(name: "silver")

product1.add_tag_by_id(1)
product1.add_tag_by_id(2)
product2.add_tag_by_id(1)
product2.add_tag_by_id(3)
product3.add_tag_by_id(3)

order = user2.place_order(product_id: 1, address: "user2 home address")

user1 = User.find(1)
user2 = User.find(2)
product1 = Product.find(1)
product2 = Product.find(2)
product3 = Product.find(3)
tag1 = Tag.find(1)
tag2 = Tag.find(2)
tag3 = Tag.find(3)
order = Order.first
