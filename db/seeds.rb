require 'nokogiri'
require 'net/http'
require 'capybara/poltergeist'

session = Capybara::Session.new(:poltergeist)

pages = [
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=0&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=6&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=12&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=18&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=24&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=30&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=26&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=42&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=48&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=54&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=60&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=66&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=72&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=78&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=84&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=90&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=96&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=102&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=108&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=114&sort=rankTitle&dtnids=11019%2C15829',
  'https://www.bostonusa.com/dine-out-boston/restaurant-search/?skip=120&sort=rankTitle&dtnids=11019%2C15829'
]

pages.each do |page|
  session.visit(page)

  session.all('.main_container div.listings .small-block-grid-1 li').each do |restaurant|
    name = restaurant.find("a.title").text
    image_url = restaurant.find("img.thumb")["src"]
    region = restaurant.find("div.region").text
    info = restaurant.find("div.address").text

    info.slice!(region + " ")
    if info.include?("Cuisine")
      address = info.slice(/.* Cuisine/)
      address = address.chomp!(" Cuisine")
    else
      address = address = info.slice(/.*/)
    end

    # Checking if they serve both lunch and dinner
    if info.include?("Lunch") && info.include?("Dinner")
      cuisine = info.slice(/Cuisine.* L/)
      cuisine = cuisine.chomp!(" L")
      cuisine = cuisine.sub!("Cuisine: ", "")
      lunch_price = info.slice(/Lunch.* Dinner/)
      if info.include?("Menu")
        lunch_price = lunch_price.sub!("Lunch: ", "")
        if lunch_price.include?("Menu")
          menus = restaurant.all('div.address a')
          lunch_menu_link = menus.first['href']
          lunch_price = lunch_price.chomp!(" / Menu Dinner")
        elsif !lunch_price.include?("Menu")
          lunch_price = lunch_price.chomp!(" Dinner")
        end

        dinner_price = info.slice(/Dinner.*/)
        dinner_price = dinner_price.sub!("Dinner: ", "")

        if dinner_price.include?("Special Notes")
          special_notes = dinner_price.slice!(/Special.*/)
          if dinner_price.include?("Menu")
            menus = restaurant.all('div.address a')
            dinner_menu_link = menus.last['href']
            dinner_price = dinner_price.chomp!(" / Menu ")
          end
        end

        if dinner_price.include?("Menu")
          menus = restaurant.all('div.address a')
          dinner_menu_link = menus.last['href']
          dinner_price = dinner_price.chomp!(" / Menu")
        end

      else
        lunch_price = lunch_price.chomp!(" Dinner")
        lunch_price = lunch_price.sub!("Lunch: ", "")
        dinner_price = info.slice(/Dinner.*/)
        dinner_price = dinner_price.sub!("Dinner: ", "")

        if dinner_price.include?("Special Notes")
          special_notes = dinner_price.slice!(/Special.*/)
        end
      end

    # Checking if they just serve lunch
    elsif info.include?("Lunch")
      cuisine = info.slice(/Cuisine.* L/)
      cuisine = cuisine.chomp!(" L")
      cuisine = cuisine.sub!("Cuisine: ", "")

      if info.include?("Menu")
        menus = restaurant.all('div.address a')
        lunch_menu_link = menus.first['href']
        lunch_price = info.slice(/Lunch.*/)
        if lunch_price.include?("Special Notes")
          special_notes = lunch_price.slice!(/Special.*/)
          lunch_price = lunch_price.chomp!(" / Menu ")
          lunch_price = lunch_price.sub!("Lunch: ", "")
        end
        if lunch_price.include?("Menu")
          lunch_price = lunch_price.chomp!(" / Menu")
          lunch_price = lunch_price.sub!("Lunch: ", "")
        end
      else
        lunch_price = info.slice(/Lunch.*/)
        lunch_price = lunch_price.sub!("Lunch: ", "")
        if lunch_price.include?("Special Notes")
          special_notes = lunch_price.slice!(/Special.*/)
        end
      end

    # Checking if they just serve dinner
    elsif info.include?("Dinner")
      cuisine = info.slice(/Cuisine.* D/)
      cuisine = cuisine.chomp!(" D")
      cuisine = cuisine.sub!("Cuisine: ", "")

      if info.include?("Menu")
        menus = restaurant.all('div.address a')
        dinner_menu_link = menus.first['href']
        dinner_price = info.slice(/Dinner.*/)
        if dinner_price.include?("Special Notes")
          special_notes = dinner_price.slice!(/Special.*/)
          dinner_price = dinner_price.chomp!(" / Menu ")
          dinner_price = dinner_price.sub!("Dinner: ", "")
        end
        if dinner_price.include?("Menu")
          dinner_price = dinner_price.sub!("Dinner: ", "")
          dinner_price = dinner_price.chomp!(" / Menu")
        end
      else
        dinner_price = info.slice(/Dinner.*/)
        dinner_price = dinner_price.sub!("Dinner: ", "")
        if dinner_price.include?("Special Notes")
          special_notes = dinner_price.slice!(/Special.*/)
        end
      end

    # They don't have any info about what meals they serve
    elsif info.include?("Cuisine")
      cuisine = info.slice(/Cuisine.*/)
      cuisine = cuisine.sub!("Cuisine: ", "")
    end

    Restaurant.create!(
      name: name,
      image_url: image_url,
      region: region,
      address: address,
      cuisine: cuisine,
      lunch_price: lunch_price,
      lunch_menu_link: lunch_menu_link,
      dinner_price: dinner_price,
      dinner_menu_link: dinner_menu_link,
      special_notes: special_notes
    )

    puts name
    puts image_url
    puts region
    puts address
    puts cuisine
    if lunch_price
      puts lunch_price
      if lunch_menu_link
        puts lunch_menu_link
      end
    end
    if dinner_price
      puts dinner_price
      if dinner_menu_link
        puts dinner_menu_link
      end
    end
    if special_notes
      puts special_notes
    end
    puts
  end
end
