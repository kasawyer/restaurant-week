/*jshint esversion: 6 */

import React from 'react';

const Favorite = props => {
  return(
    <i className="fa fa-heart-o fa-2x" aria-hidden="true" onClick={() => props.handleFavorite()}></i>
  );
}

export default Favorite;


import React, { Component } from 'react';
import Favorite from './Favorite';
// import Dined from './Dined';

class FaveDined extends Component {
