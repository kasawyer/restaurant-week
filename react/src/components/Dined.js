/*jshint esversion: 6 */

import React from 'react';

const Dined = props => {
  let dinedIcon;
  if (props.dinedMarked === true) {
    dinedIcon = <i className="fa fa-cutlery fa-2x" aria-hidden="true" onClick={() => props.handleDined()}></i>
  } else {
    dinedIcon = <i className="fa fa-cutlery fa-1x" aria-hidden="true" onClick={() => props.handleDined()}></i>
  }
  return(
    <div>
      {dinedIcon}
    </div>
  );
}

export default Dined;
