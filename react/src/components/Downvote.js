/*jshint esversion: 6 */

import React from 'react';

const Downvote = props => {
  let downvoteIcon;
  if (props.voteValue === -1) {
    downvoteIcon =
    <i className="fa fa-arrow-down fa-2x" id="downvoted" aria-hidden="true" onClick={() => props.handleDownvote()}></i>
  } else {
    downvoteIcon =
    <i className="fa fa-arrow-down fa-2x" id="not-downvoted" aria-hidden="true" onClick={() => props.handleDownvote()}></i>
  }
  return(
    <i>
      {downvoteIcon}
    </i>
  );
}

export default Downvote;
