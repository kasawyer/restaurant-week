/*jshint esversion: 6 */

import React, { Component } from 'react';
import Favorite from './Favorite';
// import Dined from './Dined';

class Restaurant extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: "",
      marked: false,
      message: ""
    };
    this.handleFavorite = this.handleFavorite.bind(this);
  }

  handleFavorite(event) {
    let favoriteData = {
      'favorite': {
        'marked': true,
        'current_user_id': this.props.currentUserId
      }
    };
    let jsonStringData = JSON.stringify(favoriteData);
    fetch(`/api/v1/restaurants/${this.props.restaurant.id}/favorites.json`, {
      method: 'post',
      body: jsonStringData
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}, (${response.statusText})`;
        let error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({ marked: event.target.marked });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
        <div className="fave-dined">
          <Favorite
          handleFavorite={this.handleFavorite}
          />
        </div>
    )
  }
}

export default Restaurant;
