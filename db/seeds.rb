require "faker"

seller_user1 = User.create(
  name: "#{Faker::Name.first_name} McSeller",
  email: Faker::Internet.email,
  password_digest: "1234567",
)

seller_user2 = User.create(
  name: "#{Faker::Name.first_name} McSeller",
  email: Faker::Internet.email,
  password_digest: "2345678",
)

buyer_user1 = User.create(
  name: "#{Faker::Name.first_name} McBuyer",
  email: Faker::Internet.email,
  password_digest: "password1",
)

buyer_user2 = User.create(
  name: "#{Faker::Name.first_name} McBuyer",
  email: Faker::Internet.email,
  password_digest: "password2",
)


earrings = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Earrings",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 10,
  stock_count: 6,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/7406128/r/il/fd49c5/2054471285/il_1588xN.2054471285_8vj4.jpg",
)

necklace = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Necklace",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 8,
  stock_count: 10,
  user_id: seller_user2.id,
  img_url: "https://i.etsystatic.com/8796630/r/il/40b74a/2079684350/il_1588xN.2079684350_cm5x.jpg",
)

hat = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Hat",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 20,
  stock_count: 5,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/5517971/r/il/c193a5/2077448910/il_1588xN.2077448910_glyl.jpg",
)

Gnome = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Christmas Gnome",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 50,
  stock_count: 5,
  user_id: seller_user2.id,
  img_url: "https://i.etsystatic.com/21638201/r/il/3b366a/2143201225/il_1588xN.2143201225_2dig.jpg",
)

Jumper = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Jumper",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 20,
  stock_count: 5,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/14450461/r/il/bb91c3/2087862590/il_1588xN.2087862590_twb7.jpg",
)

handmade_tag = Tag.create(
  name: "handmade",
)
ceramic_tag = Tag.create(
  name: "ceramic",
)
silver_tag = Tag.create(
  name: "silver",
)

earrings.add_tag_by_id(handmade_tag.id)
earrings.add_tag_by_id(ceramic_tag.id)
necklace.add_tag_by_id(handmade_tag.id)
necklace.add_tag_by_id(silver_tag.id)
hat.add_tag_by_id(handmade_tag.id)

User.find(1)
User.find(2)
Product.find(1)
Product.find(2)
Product.find(3)
Tag.find(1)
Tag.find(2)
Tag.find(3)
