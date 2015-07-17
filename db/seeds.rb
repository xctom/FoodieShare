# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Tag.delete_all
Post.delete_all
Picture.delete_all
Mark.delete_all
Reply.delete_all
Follow.delete_all
Restaurant.delete_all
Place.delete_all

Yelp.client.configure do |config|
  config.consumer_key = "qOxoGstzEM4ERC_BQxIltw"
  config.consumer_secret = "Tk1TpsaLK5aaSLTFgEfSDWhOkMQ"
  config.token = "Hdr0_0BjpxnItY1LtfNl-MrNEzIZbXvX"
  config.token_secret = "AXuqW-YSbjWrLmtgSDdJStG2_G0"
end

categories = JSON.parse(open('db/categories.json').read)

categories.each do |category|
  if category['parents'][0] == 'restaurants'

    # save tag
    tag = Tag.new
    tag.tag_name = category['title']
    tag.save

    params = { term: category['title']}

    locale = { lang: 'en' }

    response = Yelp.client.search('Chicago', params, locale)


    # Restaurant
    # yelp_id: string
    # name: string
    # image_url: string
    # url: string
    # phone: string
    # rating_img_url: string
    # location_display_address: string

    response.businesses.each do |business|
      restaurant = Restaurant.new
      restaurant.yelp_id = business.id
      restaurant.name = business.name

      if business.has_key?("image_url") &&
        restaurant.image_url = business.image_url
      else
        next
      end

      restaurant.url = business.url

      if business.has_key?("phone")
        restaurant.phone = business.phone
      elsif business.has_key?("display_phone")
        restaurant.phone = business.display_phone
      end

      restaurant.rating_img_url = business.rating_img_url

      if business.has_key?("snippet_text")
        restaurant.snippet_text = business.snippet_text
      end

      restaurant.rating = 0
      restaurant.location_display_address = "#{business.location.display_address[0]},#{business.location.display_address[1]},#{business.location.display_address[2]}"
      puts business.name
      restaurant.save

    end
  end
end

puts 'Seed Successfully'










