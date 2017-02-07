/*jshint esversion: 6 */

import React from 'react';

const Favorite = props => {
  let faveIcon;
  if (props.faveMarked === true) {
    faveIcon = <i className="fa fa-heart-o fa-2x" aria-hidden="true" onClick={() => props.handleFavorite()}></i>
  } else {
    faveIcon = <i className="fa fa-heart-o fa-1x" aria-hidden="true" onClick={() => props.handleFavorite()}></i>
  }
  return(
    <div>
      {faveIcon}
    </div>
  );
}

export default Favorite;
//
//
// import React, { Component } from 'react';
//
// class Favorite extends Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       marked: this.props.marked
//     };
//   }
//
//   render() {
//     let faveIcon;
//     if (this.props.marked === true) {
//       faveIcon = <i className="fa fa-heart-o fa-2x" aria-hidden="true" onClick={() => this.props.handleFavorite()}></i>
//     } else {
//       faveIcon = <i className="fa fa-heart-o fa-1x" aria-hidden="true" onClick={() => this.props.handleFavorite()}></i>
//     }
//     return (
//       <div>
//       {faveIcon}
//       </div>
//     )
//   }
// }
//
// export default Favorite;
