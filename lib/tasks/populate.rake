namespace :db do
  desc "Erase and fill database"
  task populate: :environment do
    Item.attr_accessible :created_at
    Pairing.attr_accessible :created_at
    make_users
    make_items2
    make_items4
    make_pairings
    make_likes
    make_comments
  end
end

def make_users
    users = ["Dev","Aishwarya","Dalai","Gwyneth","Jackie","Michelle"]
    avatar = ["https://s3.amazonaws.com/fashionapp/seed/user/%salbert_einstein.jpg",
              "https://s3.amazonaws.com/fashionapp/seed/user/%saishwarya-rai.jpg",
              "https://s3.amazonaws.com/fashionapp/seed/user/%sdalai-lama-011.jpg",
              "https://s3.amazonaws.com/fashionapp/seed/user/%sgwyneth.jpg",
              "https://s3.amazonaws.com/fashionapp/seed/user/%sJackie-Chan-9542080-1-402.jpg",
              "https://s3.amazonaws.com/fashionapp/seed/user/%sMichelle-Yeoh--001.jpg"]

    users.length.times do |user|
      name = users[user]
      email = "#{name}@dev.com"
      password = "welcome"
      currUser = User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)

      original = avatar[user] % ""
      large = avatar[user] % "600"
      medium = avatar[user] % "150"
      small = avatar[user] % "50"
      thumb = avatar[user] % "32"
      currUser.images.create!(original_url: original,
                              large_url: large,
                              medium_url: medium,
                              small_url: small,
                              thumb_url: thumb)
  end
end

def make_items2
  items = [
    "https://s3.amazonaws.com/fashionapp/seed/item/%s1272456_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s1272457_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s1287765_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s1287766_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8000328_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8000329_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8012374_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8012375_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8018510_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8018512_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8092397_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8092398_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8094409_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8094410_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8094740_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8094742_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8095285_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8095286_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8098884_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8098886_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8102173_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8102174_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8110852_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8110853_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8112198_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8112199_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8116635_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8116636_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8118276_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8118277_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8126399_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8126401_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8127086_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8127087_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8127166_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8127167_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8130115_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8130117_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8133828_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8133829_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8134720_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8134721_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8138622_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8138623_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8141819_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8141821_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8142467_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8142468_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147091_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147092_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147096_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147097_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147481_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147483_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8149502_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8149503_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8230374_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8230375_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8233411_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8233412_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235589_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235590_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241957_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241958_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241975_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241976_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242532_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242533_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242560_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242561_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242937_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242938_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs100.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs101.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs102.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs103.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs104.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs105.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs106.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs107.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs108.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs109.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs110.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%svs111.jpg"
  ]
  index = 0

  User.all.each do |user|
    (items.length/2/User.count).times do
      #Item data
      name=Faker::Lorem.words(2).join(" ")
      tags=Faker::Lorem.words(4).join(",")
      #Create item
      item=user.items.create!(name:name,
                              tag_list:tags,
                              created_at: Random.rand(1000).minutes.ago)

      #2 Item pics
      2.times do
        original=items[index]%""
        large=items[index]%"600"
        medium=items[index]%"204"
        small=items[index]%"150"
        thumb=items[index]%"50"
        item.images.create!(original_url: original,
                            large_url: large,
                            medium_url: medium,
                            small_url: small,
                            thumb_url: thumb)
        index+=1
      end
    end
  end
end

def make_items4
  items = [
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8122458_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8122459_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8122460_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8122461_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8125778_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8125779_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8126100_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8126101_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8138550_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8138551_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8138552_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8138553_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145898_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145899_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145900_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145901_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145988_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145989_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145990_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8145991_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8146051_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8146052_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8146053_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8146054_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147259_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147260_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147261_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8147262_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226012_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226013_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226014_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226015_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226105_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226106_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226107_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226108_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226334_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226335_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226336_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226337_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226712_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226713_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226714_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8226715_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229231_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229232_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229233_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229234_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229242_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229243_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229244_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229245_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229250_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229251_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229252_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229253_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229281_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229282_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229283_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229284_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229494_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229495_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229496_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229497_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229528_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229529_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229530_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229531_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229995_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229996_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229997_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8229998_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235635_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235636_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235637_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235638_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235914_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235915_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235916_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235917_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235954_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235955_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235956_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8235957_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237197_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237198_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237199_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237200_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237204_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237205_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237206_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8237207_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241934_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241935_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241936_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8241937_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242476_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242477_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242478_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8242479_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247693_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247694_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247695_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247696_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247757_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247758_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247759_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247760_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247859_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247860_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247861_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8247862_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8248971_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8248972_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8248973_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8248974_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8251318_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8251319_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8251320_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%s8251321_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf100.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf101.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf102.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf103.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf104.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf105.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf106.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf107.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf108.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf109.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf110.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf111.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf112.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf113.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf114.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf115.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf116.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf117.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf118.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf119.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf120.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf121.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf122.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf123.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf124.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf125.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf126.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf127.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf128.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf129.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf130.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf131.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf132.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf133.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf134.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf135.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf136.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf137.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf138.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf139.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf140.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf141.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf142.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf143.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf144.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf145.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf146.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf147.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf148.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf149.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf150.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf151.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf152.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf153.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf154.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf155.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf156.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf157.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf158.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf159.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf160.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf161.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf162.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf163.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf164.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf165.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf166.jpg",
    "https://s3.amazonaws.com/fashionapp/seed/item/%sdf167.jpg"
  ]
  index = 0

  User.all.each do |user|
    (items.length/4/User.count).times do
      #Item data
      name=Faker::Lorem.words(2).join(" ")
      tags=Faker::Lorem.words(4).join(",")
      #Create item
      item=user.items.create!(name:name,
                              tag_list:tags,
                              created_at: Random.rand(1000).minutes.ago)

      #4 Item pics
      4.times do
        original=items[index]%""
        large=items[index]%"600"
        medium=items[index]%"204"
        small=items[index]%"150"
        thumb=items[index]%"50"
        item.images.create!(original_url: original,
                            large_url: large,
                            medium_url: medium,
                            small_url: small,
                            thumb_url: thumb)
        index+=1
      end
    end
  end
end

def make_pairings
  pairings = ["https://s3.amazonaws.com/fashionapp/seed/pairing/%s1197502_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s1197503_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8033010_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8033012_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8068159_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8068161_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8069383_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8069385_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8075841_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8075842_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8076175_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8076177_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8086565_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8086566_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8100230_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8113266_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8104628_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8104629_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8104827_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8104828_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8112096_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8112097_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8113256_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8113257_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8114496_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8114498_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8114501_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8114502_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8117095_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8117097_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8120598_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8120600_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8126356_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8126358_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8127210_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8127211_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8127347_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8127349_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8134004_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8134005_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8134008_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8134009_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8134658_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8134659_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8150124_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8150126_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8227126_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8227127_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8228882_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8228883_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8229113_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8229115_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8229187_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8229189_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8233424_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8233425_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8233606_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8233607_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8233675_fpx.jpeg",
    "https://s3.amazonaws.com/fashionapp/seed/pairing/%s8233676_fpx.jpeg"]

  index = 0

  User.all.each do |user|
    (pairings.length/2/User.count).times do
      #Pairing data
      name=Faker::Lorem.words(2).join(" ")
      tags=Faker::Lorem.words(4).join(",")
      itemarray=user.items.sample(Random.rand(5)).collect(&:id).join(",")
      #Create pairing
      pairing=user.pairings.create!(name:name,
                              tag_list:tags,
                              item_array: itemarray,
                              created_at: Random.rand(1000).minutes.ago)
      
      #2 Pairing pics
      2.times do
        original=pairings[index]%""
        large=pairings[index]%"600"
        medium=pairings[index]%"204"
        small=pairings[index]%"150"
        thumb=pairings[index]%"50"
        pairing.images.create!(original_url: original,
                            large_url: large,
                            medium_url: medium,
                            small_url: small,
                            thumb_url: thumb)
        index+=1
      end
    end
  end
end

def make_likes
  #Like pairings
  Pairing.all.each do |pairing|
    User.all.sample(Random.rand(5)).each do |user|
      user.liked_pairings << pairing
    end
  end
  #Like items
  Item.all.each do |item|
    User.all.sample(Random.rand(5)).each do |user|
      user.liked_items << item
    end
  end
end

def make_comments
  #Comment pairings
  Pairing.all.each do |pairing|
    4.times do
      User.all.sample(Random.rand(3)).each do |user|
        user.comment_pairings.create!(pairing: pairing,
                                      comment: Faker::Lorem.paragraph(1))
      end
    end
  end
  #Comment items
  Item.all.each do |item|
    4.times do
      User.all.sample(Random.rand(3)).each do |user|
        user.comment_items.create!(item: item,
                                 comment: Faker::Lorem.paragraph(1))
      end
    end
  end
end