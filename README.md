# FoodieShare
- This is a yelp-based social web application where users can share comments for a restaurant, follow each other and look for good restaurants in Chicago
- Login Page

<img src="https://github.com/xctom/FoodieShare/blob/master/screenshots/index.png" width="700"/>

- Post a review

<img src="https://github.com/xctom/FoodieShare/blob/master/screenshots/reviews.png" width="700"/>

- Restaurant List

<img src="https://github.com/xctom/FoodieShare/blob/master/screenshots/restaurants.png" width="700"/>

- Restaurant Detail

<img src="https://github.com/xctom/FoodieShare/blob/master/screenshots/restaurant.png" width="700"/> 

- User Home Page

<img src="https://github.com/xctom/FoodieShare/blob/master/screenshots/userHome.png" width="700"/>

# Setup
### Install HomeBrew
Homebrew is a command-line tool that allows for easy installation of software packages from source. It comes with a straightforward one-line install script. If it asks you to install Xcode command-line tools, say yes.

In Terminal, copy-and-paste the following line and hit return:

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
### Install Ruby on Rails
Now that Homebrew is installed, we can install both Ruby and the Rails framework all in one shot.

In Terminal:

    \curl -sSL https://get.rvm.io | bash -s stable --rails

### Yelp Dev Account
You will need a yelp developer account to get access restaurant data from yelp.[Apply here](https://www.yelp.com/developers/documentation/v2/overview).

In app/controllers/restaurants_controller.rb and db/seed.rb, find following code and use your own yelp OAuth tokens:

```ruby
#put your yelp parameters here
Yelp.client.configure do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.token = ""
  config.token_secret = ""
end
```

### Google Dev Account
You will need a Google developer key for accessing Google Map by Javascript. [See Section |Obtaining an API Key |](https://developers.google.com/maps/documentation/javascript/tutorial)

In app/views/restaurants/index.html, fint following code and replace "youAPIKey" by your API key:
```javascript
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&key=youAPIKey&sensor=SET_TO_TRUE_OR_FALSE"></script>
```

### App Setup
Now you have set your environment and your developer accounts, let us get it start.

In Terminal, cd into /FoodieShare, type following commands one by one:

    bundle install
    rake db:migrate
    rake db:seed
    rails server

Then visit localhost:3000 in your broswer, enjoy!
