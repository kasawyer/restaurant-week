/*jshint esversion: 6 */

import React, { Component } from 'react';
import FaveDined from './FaveDined';

class Restaurant extends Component {
  constructor() {
    super();
    this.state = {
    };
  }

  render() {
    return (
      <FaveDined
      restaurantId={document.getElementById('restaurant-id').value}
      favoriteId={document.getElementById('favorite-id').value}
      dinedId={document.getElementById('dined-id').value}
      currentUserId={document.getElementById('current-user-id').value}
      admin={document.getElementById('admin').value}
      />
    );
  }
}

export default Restaurant;
