/*jshint esversion: 6 */

import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
// import RestaurantList from './components/RestaurantList';

$(function() {
  if (document.getElementById('review-list')) {
    ReactDOM.render(
      <App />,
      document.getElementById('review-list')
    );
  }
  // if (document.getElementById('restaurant-list')) {
  //   ReactDOM.render(
  //     <RestaurantList />,
  //     document.getElementById('restaurant-list')
  //   );
  // }
});
