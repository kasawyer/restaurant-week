/*jshint esversion: 6 */

import React, { Component } from 'react';
import Restaurant from './Restaurant';

class FaveDined extends Component {
  constructor() {
    super();
    this.state = {
    };
  }

  render() {
    return (
      <div>
        <Restaurant
        restaurantId={document.getElementById('restaurant-id').value}
        currentUserId={document.getElementById('current-user-id').value}
        admin={document.getElementById('admin').value}
        />
      </div>
    );
  }
}

export default FaveDined;
