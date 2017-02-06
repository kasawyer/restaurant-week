/*jshint esversion: 6 */

import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import FaveDined from './components/FaveDined';

$(function() {
  if (document.getElementById('review-list')) {
    ReactDOM.render(
      <App />,
      document.getElementById('review-list')
    );
  }
  if (document.getElementById('fave-dined')) {
    ReactDOM.render(
      <FaveDined />,
      document.getElementById('fave-dined')
    );
  }
});
