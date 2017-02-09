/*jshint esversion: 6 */

import React from 'react';

const Favorite = props => {
  let faveIcon;
  if (props.faveMarked === true) {
    faveIcon =
    <div>
      <i className="fa fa-heart fa-2x" id="fave" aria-hidden="true" onClick={() => props.handleFavorite()}></i>
      <p id="fave-text">Unfavorite</p>
    </div>
  } else {
    faveIcon =
    <div>
      <i className="fa fa-heart-o fa-2x" id="no-fave" aria-hidden="true" onClick={() => props.handleFavorite()}></i>
      <p id="fave-text">Favorite</p>
    </div>
  }
  return(
    <span className="fave-dined-span">
      {faveIcon}
    </span>
  );
}

export default Favorite;
