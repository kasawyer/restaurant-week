/*jshint esversion: 6 */

import React, { Component } from 'react';
import ReviewList from './ReviewList';

class App extends Component {
  constructor() {
    super();
    this.state = {
    };
  }

  render() {
    return (
      <ReviewList
      restaurantId={document.getElementById('restaurant-id').value}
      currentUserId={document.getElementById('current-user-id').value}
      admin={document.getElementById('admin').value}
      voteValue={document.getElementById('existing-vote').value}
      voteId={document.getElementById('existing-vote').value}
      />
    );
  }
}

export default App;
