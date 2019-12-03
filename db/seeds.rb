require "faker"

seller_user = User.create(
  name: "#{Faker::Name.first_name} McSeller",
  email: Faker::Internet.email,
  password_digest: "password",
)

buyer_user = User.create(
  name: "#{Faker::Name.first_name} McBuyer",
  email: Faker::Internet.email,
  password_digest: "password",
)

earrings = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Earrings",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 10,
  stock_count: 6,
  user_id: seller_user.id,
  img_url: Faker::LoremPixel.image(size: "128x128", is_gray: false, category: "abstract", number: 1),
)

necklace = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Necklace",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 8,
  stock_count: 10,
  user_id: seller_user.id,
  img_url: Faker::LoremPixel.image(size: "128x128", is_gray: false, category: "abstract", number: 2),
)

hat = Product.create(
  name: "#{Faker::Hipster.word.capitalize} Hat",
  description: Faker::Hipster.sentence,
  created_at: Time.now,
  price: 20,
  stock_count: 5,
  user_id: seller_user.id,
  img_url: Faker::LoremPixel.image(size: "128x128", is_gray: false, category: "abstract", number: 3),
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
