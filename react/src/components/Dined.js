/*jshint esversion: 6 */

import React, { Component } from 'react';

class Dined extends Component {
  constructor(props) {
    super(props);
    this.state = {
      marked: this.props.dinedMarked
    };
  }

  render() {
    let dinedIcon;
    if (this.props.dinedMarked === true) {
      dinedIcon = <i className="fa fa-cutlery fa-2x" aria-hidden="true" onClick={() => this.props.handleDined()}></i>
    } else {
      dinedIcon = <i className="fa fa-cutlery fa-1x" aria-hidden="true" onClick={() => this.props.handleDined()}></i>
    }
    return (
      <div>
      {dinedIcon}
      </div>
    )
  }
}

export default Dined;
