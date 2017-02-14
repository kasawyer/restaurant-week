[![Code Climate](https://codeclimate.com/github/kasawyer/restaurant-week/badges/gpa.svg)](https://codeclimate.com/github/kasawyer/restaurant-week)
[![Coverage Status](https://coveralls.io/repos/github/kasawyer/restaurant-week/badge.svg?branch=master)](https://coveralls.io/github/kasawyer/restaurant-week?branch=master)
![Build Status](https://codeship.com/projects/8d5583f0-c9f0-0134-a95b-461788d15a71/status?branch=master)

# DineOut+

DineOut+ is a web application built on Rails and React.js that allows users to see all restaurants participating in Dine Out Boston (formerly Restaurant Week), and review, favorite, and save restaurants as dined!

### Features

The following features exist within the application:

- A list of restaurants participating in Dine Out, populated through a custom-web-scraper that uses Capybara and Poltergeist to scrape the official Dine Out Boston website and save results to the PSQL database.
- The ability to write a review on a restaurant, and give it a score out of 5.
- The ability to upvote or downvote a review using React.js for a smooth user experience. A user can only upvote or downvote once and can change their vote from up to down.
- A sign up and authentication system for your users (with devise).
- The ability to upload a profile photo (with CarrierWave).
- The ability to search for restaurants using an advanced search form based on set categories or keywords.
- An admin role. Admins are able to delete reviews or user accounts if they are deemed to be inappropriate.
- The ability to save restaurants as favorites or dined using React.js.

## Deployment

This app can be viewed at https://wwww.dine-out-plus.herokuapp.com

## Built With

* [Rails](http://rubyonrails.org/) - the web application framework used
* [React.js](https://facebook.github.io/react/) - Used for building the user interface
* [Devise](https://rometools.github.io/rome/) - Used to for user authentication

## Authors

Katherine Sawyer - (https://github.com/kasawyer)
