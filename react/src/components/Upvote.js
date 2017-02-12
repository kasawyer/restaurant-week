/*jshint esversion: 6 */

import React from 'react';

const Upvote = props => {
  let upvoteIcon;
  if (props.voteValue === 1) {
    upvoteIcon =
    <i className="fa fa-arrow-up fa-2x" id="upvoted" aria-hidden="true" onClick={() => props.handleUpvote()}></i>
  } else {
    upvoteIcon =
    <i className="fa fa-arrow-up fa-2x" id="not-upvoted" aria-hidden="true" onClick={() => props.handleUpvote()}></i>
  }
  return(
    <i>
      {upvoteIcon}
    </i>
  );
}

export default Upvote;
