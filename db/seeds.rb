require "faker"

seller_user1 = User.create(
  name: "Qing's pins",
  email: Faker::Internet.email,
  password: "1234567"
)

seller_user2 = User.create(
  name: "Faris' winter emporium",
  email: Faker::Internet.email,
  password: "2345678"
)

seller_user3 = User.create(
  name: "Harrison's cattle shack",
  email: Faker::Internet.email,
  password: "123456789"
)




christmas1 = Product.create(
  name: "Family santa hats",
  description: "Get in the christmas spirit with this stupid headwear! (WARNING: HIGHLY FLAMMABLE. KEEP AWAY FROM CHILDREN AND PETS)",
  created_at: Time.now,
  price: 7,
  stock_count: 50,
  user_id: seller_user2.id,
  img_url: "https://i.etsystatic.com/5517971/r/il/c193a5/2077448910/il_1588xN.2077448910_glyl.jpg"
)

christmas2 = Product.create(
  name: "Crochet santa brooch",
  description: "Miniature crochet Santa brooch is made from cotton thread. Cute and sweet Christmas Santa can decorate your jumper, hat or bag and adds festive feeling for everybody. Perfect gift for friend, family or colleague. (WARNING: HIGHLY FLAMMABLE. KEEP AWAY FROM CHILDREN AND PETS)",
  created_at: Time.now,
  price: 8,
  stock_count: 26,
  user_id: seller_user2.id,
  img_url: "https://i.etsystatic.com/7323865/r/il/5cd13f/2050441090/il_794xN.2050441090_5mmi.jpg"
)

christmas3 = Product.create(
  name: "Christmas tree candle",
  description: "A chritsmas tree candle. What more can you say? (WARNING: OBVIOUSLY HIGHLY FLAMMABLE. KEEP AWAY FROM CHILDREN AND PETS)",
  created_at: Time.now,
  price: 15,
  stock_count: 30,
  user_id: seller_user2.id,
  img_url: "https://johnlewis.scene7.com/is/image/JohnLewis/238122949?$rsp-pdp-port-1080$"
)

christmas4 = Product.create(
  name: "Llama jumper",
  description: "Feel the llama love this christmas. Or don't, your call. (WARNING: HIGHLY FLAMMABLE. KEEP AWAY FROM CHILDREN AND PETS)",
  created_at: Time.now,
  price: 20,
  stock_count: 10,
  user_id: seller_user2.id,
  img_url: "https://i.etsystatic.com/14450461/r/il/bb91c3/2087862590/il_1588xN.2087862590_twb7.jpg"
)

christmas5 = Product.create(
  name: "Oh my christmas jumper",
  description: "Probably a Gavin and Stacey reference. (WARNING: HIGHLY FLAMMABLE. KEEP AWAY FROM CHILDREN AND PETS)",
  created_at: Time.now,
  price: 25,
  stock_count: 25,
  user_id: seller_user2.id,
  img_url: "https://i.etsystatic.com/9052090/r/il/60d3ba/2037083086/il_794xN.2037083086_jc31.jpg"
)

christmas6 = Product.create(
  name: "Christmas tree hat",
  description: "Do it. Look like an idiot this christmas. Buy this hat. We dare you. (WARNING: HIGHLY FLAMMABLE. KEEP AWAY FROM CHILDREN AND PETS)",
  created_at: Time.now,
  price: 2,
  stock_count: 100,
  user_id: seller_user2.id,
  img_url: "https://i.etsystatic.com/19005213/r/il/393d7f/2137958995/il_794xN.2137958995_ilkx.jpg"
)

pin1 = Product.create(
  name: "There is no planet B Pin",
  description: "Reuse , recycle , respect our planet because there is only one. A glittery hard enamel lapel pin to wear on your favourite outfits or add to your pin collection. Designed in Australia, created on iPad Procreate.",
  created_at: Time.now,
  price: 5,
  stock_count: 20,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/17545368/r/il/d8e4d7/1925318058/il_794xN.1925318058_fl5l.jpg"
)

pin2 = Product.create(
  name: "Feefoo - Ferret Pin",
  description: "A little Dooker to make you a looker.",
  created_at: Time.now,
  price: 8,
  stock_count: 10,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/6316848/r/il/817ab3/2069246752/il_794xN.2069246752_d0xc.jpg"
)

pin3 = Product.create(
  name: "Sailor Joon Spinning Hard Enamel Pin",
  description: "Spinning Pin (the top face part turns). Hard Enamel. Gold plating. 2.5 inches. Pink glitter on bottom part. 2 rubber clutches. Back stamp. Arrives on backing card.",
  created_at: Time.now,
  price: 12,
  stock_count: 3,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/20281840/r/il/4b31cf/2149762777/il_794xN.2149762777_s0wf.jpg"
)

pin4 = Product.create(
  name: "No Dairy Milk Carton Enamel Pin",
  description: "This cute 'No Dairy' milk carton pin looks great wherever it's put! Perfect for vegans, veggies, or someone who just doesn't have dairy. They are available in green and pink!",
  created_at: Time.now,
  price: 4,
  stock_count: 16,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/15663108/r/il/f726f8/2078550585/il_794xN.2078550585_500g.jpg"
)

pin5 = Product.create(
  name: "Vinyl Is Not Dead Enamel Pin",
  description: "Whether you love music, vinyl records, vintage items or if you just enjoy really cool accessories, the original design of this custom enamel pin will complement any collection. Wear it on your backpack, instrument case or on the lapel or pocket of your favorite denim or leather jacket. The Vinyl is Not Dead pin is nickel plated iron with intricately detailed lines and lettering. The silver plating is complemented with red and black matte colors. The pin secures with a standard military clutch.",
  created_at: Time.now,
  price: 5,
  stock_count: 13,
  user_id: seller_user1.id,
  img_url: "https://i.etsystatic.com/13718768/r/il/cf0a9e/1193718620/il_794xN.1193718620_2xmv.jpg"
)


cow1 = Product.create(
  name: "Angus cattle",
  description: "The Aberdeen Angus, sometimes simply Angus, is a Scottish breed of small beef cattle. It derives from cattle native to the counties of Aberdeenshire and Angus in north-eastern Scotland. The Angus is naturally polled and solid black or red, though the udder may be white.",
  created_at: Time.now,
  price: 1000,
  stock_count: 2,
  user_id: seller_user3.id,
  img_url: "https://www.thenational.scot/resources/images/7159800.jpg?display=1&htype=0&type=responsive-gallery"
)

cow2 = Product.create(
  name: "Highland cattle",
  description: "Highland cattle, also called long-haired Highland cattle, long-haired Scottish cattle, North Highland cattle, Scottish cattle, Scottish Highland cattle, and West Highland cattle, are a Scottish breed of cattle.",
  created_at: Time.now,
  price: 800,
  stock_count: 6,
  user_id: seller_user3.id,
  img_url: "https://upload.wikimedia.org/wikipedia/commons/4/43/Cow_on_Pupers.jpg"
)

cow3 = Product.create(
  name: "Texas Longhorn",
  description: "The Texas Longhorn is a breed of cattle known for its characteristic horns, which can extend to over 70 inches tip to tip for bulls, and up to 100 inches tip to tip for steers and exceptional cows.",
  created_at: Time.now,
  price: 1300,
  stock_count: 10,
  user_id: seller_user3.id,
  img_url: "https://media.nbcdfw.com/images/652*367/pancho-via-guinness-book1.JPG"
)

cow4 = Product.create(
  name: "Beefmaster",
  description: "Beefmaster is a breed of beef cattle that was developed in the early 1930s by Tom Lasater, after his father Ed c. Lasater created the breed, from a crossing of Hereford cows and Shorthorn cows with Brahman bulls.",
  created_at: Time.now,
  price: 2100,
  stock_count: 4,
  user_id: seller_user3.id,
  img_url: "https://www.thatsfarming.com/uploads/news/resizeExact_1200_800/2496-Bull-Casey5-48.jpg"
)









handmade_tag = Tag.create(
  name: "handmade"
)

cow_tag = Tag.create(
  name: "cow"
)
very_large_tag = Tag.create(
  name: "incredibly large"
)

pin_tag = Tag.create(
  name: "pin"
)

shiny_tag = Tag.create(
  name: "shiny"
)

christmas_tag = Tag.create(
  name: "christmas-themed"
)

jewellery_tag = Tag.create(
  name: "jewellery"

)

unique_tag = Tag.create(
  name: "unique"
)

#[cow1, cow2, cow3, cow4].each{|cow|cow.add_tag_by_id(cow_tag.id)}
#[cow1, cow3, cow4].each{|cow|cow.add_tag_by_id(very_large_tag.id)}
#[cow1, cow2, cow3, cow4].each{|cow|cow.add_tag_by_id(goes_moo_tag.id)}

#[pin1, pin2, pin3, pin4, pin5].each{|pin|pin.add_tag_by_id(pin_tag.id)}
#[pin1, pin3].each{|pin|pin.add_tag_by_id(shiny_tag.id)}
#[pin1, pin2, pin3].each{|pin|pin.add_tag_by_id(handmade_tag.id)}

[christmas1, christmas2, christmas3, christmas4, christmas5, christmas6].each{|item|item.add_tag_by_id(christmas_tag.id)}

[pin1, pin2, pin3, pin4, pin5].each{|pin|pin.add_tag_by_id(pin_tag.id)}

[cow1, cow2, cow3, cow4].each{|cow|cow.add_tag_by_id(cow_tag.id)}

# User.find(1)
# User.find(2)
# Product.find(1)
# Product.find(2)
# Product.find(3)
# Tag.find(1)
# Tag.find(2)
# Tag.find(3)
