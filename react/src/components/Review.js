/*jshint esversion: 6 */

import React, { Component } from 'react';
import Upvote from './Upvote';
import Downvote from './Downvote';
import EditForm from './EditForm';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: "",
      total_votes: 0,
      editing: false,
      rating: this.props.review.rating,
      body: this.props.review.body,
      voteId: parseFloat(this.props.voteId),
      voteValue: parseFloat(this.props.voteValue),
      message: ""
    };
    this.componentWillMount = this.componentWillMount.bind(this);
    this.componentDidMount = this.componentDidMount.bind(this);
    this.getVotes = this.getVotes.bind(this);
    this.handleUpvote = this.handleUpvote.bind(this);
    this.handleDownvote = this.handleDownvote.bind(this);
    this.handleEdit = this.handleEdit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.saveEdit = this.saveEdit.bind(this);
  }

  componentWillMount() {
    fetch(`/api/v1/reviews/${this.props.review.id}/users.json`)
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
      let user = body;
      this.setState({ user: user });
    })
    .then(response => {
      fetch(`/api/v1/reviews/${this.props.review.id}/total_votes.json`)
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
        let total_votes = body;
        this.setState({ total_votes: total_votes });
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getVotes();
  }

  getVotes() {
    fetch(`/api/v1/reviews/${this.props.review.id}/votes.json`, {
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok && response != 204) {
        return response;
      } else {
        let errorMessage = `${response.status}, (${response.statusText})`;
        let error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      let value = body.value;
      this.setState({ voteValue: value });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleUpvote() {
    let voteData = {
      'vote': {
        'value': this.state.voteValue + 1,
        'current_user_id': this.props.currentUserId
      }
    };
    let jsonStringData = JSON.stringify(voteData);
    fetch(`/api/v1/reviews/${this.props.review.id}/votes/${this.state.voteId}.json`, {
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
      let value = body.value;
      let total_votes = body.total_votes;
      this.setState({ total_votes: total_votes });
      if (this.state.voteValue == -1 || this.state.voteValue === 0) {
        this.setState({ voteValue: value });
      } else {
        this.setState({ voteValue: 1});
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleDownvote() {
    let voteData = {
      'vote': {
        'value': this.state.voteValue - 1,
        'current_user_id': this.props.currentUserId
      }
    };
    let jsonStringData = JSON.stringify(voteData);
    fetch(`/api/v1/reviews/${this.props.review.id}/votes/${this.state.voteId}.json`, {
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
      let value = body.value;
      let total_votes = body.total_votes;
      this.setState({ total_votes: total_votes });
      if (this.state.voteValue == 1 || this.state.voteValue === 0) {
        this.setState({ voteValue: value });
      } else {
        this.setState({ voteValue: -1});
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleEdit(review_id) {
    this.setState({
      editing: true
    });
  }

  handleRatingChange(event) {
    let newRating = event.target.value;
    this.setState({ rating: newRating });
  }

  handleBodyChange(event) {
    let newBody = event.target.value;
    this.setState({ body: newBody });
  }

  saveEdit(event) {
    event.preventDefault();
    let reviewData = {
      'review': {
        'rating': this.state.rating,
        'body': this.state.body
      }
    };
    let jsonStringData = JSON.stringify(reviewData);
    fetch(`/api/v1/reviews/${this.props.review.id}.json`, {
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
      let review = body.review;
      let message = body.message;
      let editing = body.editing;
      this.setState({
        rating: review.rating,
        body: review.body,
        message: message,
        editing: editing
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let form;
    if (this.state.editing && (this.props.currentUserId === this.props.review.user_id || this.props.admin === 'true')) {
      form =
      <EditForm
      currentRating={this.state.rating}
      currentBody={this.state.body}
      handleRatingChange={this.handleRatingChange}
      handleBodyChange={this.handleBodyChange}
      saveEdit={this.saveEdit}
      />;
    }
    let editButton;
    let deleteButton;
    if (this.props.currentUserId === this.props.review.user_id || this.props.admin == 'true') {
      editButton = <span className="edit-delete" onClick={() => this.handleEdit()}>Edit</span>;
      deleteButton = <span className="edit-delete" onClick={this.props.handleDelete}>Delete</span>;
    }
    return (
      <div className="review-list-item">
        <p>{this.state.message}</p>
        <div className="vote-buttons">
          <Upvote
          handleUpvote={this.handleUpvote}
          voteValue={this.state.voteValue}
          />
          <br />
          <p>{this.state.total_votes}</p>
          <Downvote
          handleDownvote={this.handleDownvote}
          voteValue={this.state.voteValue}
          />
        </div>
        <div className="review-body">
          <p>
          <span className="prompt">Created at: </span>
          {new Date(this.props.review.created_at).toLocaleString()}
          </p>
          <p>
          <span className="prompt">User: </span>
          {this.state.user.name}
          </p>
          <p>
            <span className="prompt">Rating: </span>
            {this.state.rating}
          </p>
          <p>
            <span className="prompt">Review: </span>
            {this.state.body}
          </p>
          {editButton}
          {deleteButton}
          <br/>
          {form}
        </div>
      </div>
    );
  }
}

export default Review;
