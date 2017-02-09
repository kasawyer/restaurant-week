/*jshint esversion: 6 */

import React from 'react';

const Dined = props => {
  let dinedIcon;
  if (props.dinedMarked === true) {
    dinedIcon =
    <div className="dined">
      <i className="fa fa-cutlery fa-2x" id="dined" aria-hidden="true" onClick={() => props.handleDined()}></i>
      <p id="dined-text">Unmark dined</p>
    </div>
  } else {
    dinedIcon =
    <div className="dined">
      <i className="fa fa-cutlery fa-2x" id="no-dined" aria-hidden="true" onClick={() => props.handleDined()}></i>
      <p id="dined-text">Mark dined</p>
    </div>
  }
  return(
    <span className="fave-dined-span">
      {dinedIcon}
    </span>
  );
}

export default Dined;
