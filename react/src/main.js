/*jshint esversion: 6 */

import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import Restaurant from './components/Restaurant';

$(function() {
  if (document.getElementById('review-list')) {
    ReactDOM.render(
      <App />,
      document.getElementById('review-list')
    );
  }
  if (document.getElementById('restaurant')) {
    ReactDOM.render(
      <Restaurant />,
      document.getElementById('restaurant')
    );
  }
});
