/*jshint esversion: 6 */

import React, { Component } from 'react';
import Favorite from './Favorite';
// import Dined from './Dined';

class FaveDined extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurantId: parseInt(this.props.restaurantId),
      currentUserId: parseInt(this.props.currentUserId),
      admin: this.props.admin,
      favoriteId: parseInt(this.props.favoriteId),
      marked: ""
    };
    this.componentDidMount = this.componentDidMount.bind(this);
    this.getFavorite = this.getFavorite.bind(this);
    this.handleFavorite = this.handleFavorite.bind(this);
  }

  componentDidMount() {
    this.getFavorite();
  }

  getFavorite() {
    fetch(`/api/v1/restaurants/${this.state.restaurantId}/favorites.json`, {
      credentials: 'same-origin'
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
      let favorite = body.favorite;
      let isMarked = favorite.marked;
      this.setState({ marked: isMarked });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleFavorite() {
    let favoriteData = {
      'favorite' : {
        'favorite_id': this.state.favoriteId,
        'user_id': this.state.currentUserId,
        'restaurant_id': this.state.restaurantId,
        'marked': !this.state.marked
      }
    };
    let jsonStringData = JSON.stringify(favoriteData);
    fetch(`/api/v1/restaurants/${this.state.restaurantId}/favorites/${this.state.favoriteId}.json`, {
      method: 'put',
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
      let favorite = body.favorite;
      this.setState({
        marked: favorite.marked,
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div className="fave-dined">
        <Favorite
        key={this.state.favoriteId}
        handleFavorite={this.handleFavorite}
        currentUserId={this.state.currentUserId}
        admin={this.state.admin}
        />
      </div>
    )
  }
}

export default FaveDined;
