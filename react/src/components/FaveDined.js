/*jshint esversion: 6 */

import React, { Component } from 'react';
import Favorite from './Favorite';
import Dined from './Dined';

class FaveDined extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurantId: parseInt(this.props.restaurantId),
      currentUserId: parseInt(this.props.currentUserId),
      admin: this.props.admin,
      favoriteId: parseInt(this.props.favoriteId),
      dinedId: parseInt(this.props.dinedId),
      faveMarked: "",
      dinedMarked: ""
    };
    this.componentDidMount = this.componentDidMount.bind(this);
    this.getFavorite = this.getFavorite.bind(this);
    this.getDined = this.getDined.bind(this);
    this.handleFavorite = this.handleFavorite.bind(this);
    this.handleDined = this.handleDined.bind(this);
  }

  componentDidMount() {
    this.getFavorite();
    this.getDined();
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
      let marked = favorite.marked;
      this.setState({ faveMarked: marked });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  getDined() {
    fetch(`/api/v1/restaurants/${this.state.restaurantId}/dineds.json`, {
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
      let dined = body.dined;
      let marked = dined.marked;
      this.setState({ dinedMarked: marked });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleFavorite() {
    let favoriteData = {
      'favorite' : {
        'favorite_id': this.state.favoriteId,
        'user_id': this.state.currentUserId,
        'restaurant_id': this.state.restaurantId,
        'marked': !this.state.faveMarked
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
        faveMarked: favorite.marked,
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleDined() {
    let dinedData = {
      'dined' : {
        'dined_id': this.state.dinedId,
        'user_id': this.state.currentUserId,
        'restaurant_id': this.state.restaurantId,
        'marked': !this.state.dinedMarked
      }
    };
    let jsonStringData = JSON.stringify(dinedData);
    fetch(`/api/v1/restaurants/${this.state.restaurantId}/dineds/${this.state.dinedId}.json`, {
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
      let dined = body.dined;
      this.setState({
        dinedMarked: dined.marked,
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
          faveMarked={this.state.faveMarked}
        />
        <Dined
          key={this.state.dinedId}
          handleDined={this.handleDined}
          dinedMarked={this.state.dinedMarked}
        />
      </div>
    )
  }
}

export default FaveDined;
