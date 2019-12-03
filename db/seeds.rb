user1 = User.create(name: "Seed seller", email: "seed@email", password_digest: "password")
user2 = User.create(name: "Seed buyer", email: "seed@email", password_digest: "password")

product1 = Product.create(name: "seed earrings", description: "desc earrings", created_at: Time.now, price: 10, stock_count: 6, user_id: user1.id, img_url: "https://i.etsystatic.com/21638201/r/il/3b366a/2143201225/il_1588xN.2143201225_2dig.jpg")
product2 = Product.create(name: "seed necklaces", description: "desc necklaces", created_at: Time.now, price: 8, stock_count: 10, user_id: user1.id, img_url: "https://i.etsystatic.com/8796630/r/il/40b74a/2079684350/il_1588xN.2079684350_cm5x.jpg")
product3 = Product.create(name: "seed hats", description: "desc hats", created_at: Time.now, price: 20, stock_count: 5, user_id: user1.id, img_url: "https://asset1.cxnmarksandspencer.com/is/image/mands/9-Pack-Glass-Jewel-Tone-Baubles-2/PL_05_T40_8783P_XT_X_EC_0?$PDP_INT_IMAGEGRID_1_LG$")

tag1 = Tag.create(name: "handmade")
tag2 = Tag.create(name: "ceramic")
tag3 = Tag.create(name: "silver")

product1.add_tag_by_id(1)
product1.add_tag_by_id(2)
product2.add_tag_by_id(1)
product2.add_tag_by_id(3)
product3.add_tag_by_id(3)

user1 = User.find(1)
user2 = User.find(2)
product1 = Product.find(1)
product2 = Product.find(2)
product3 = Product.find(3)
tag1 = Tag.find(1)
tag2 = Tag.find(2)
tag3 = Tag.find(3)

