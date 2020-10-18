import React from 'react';
import PropTypes from 'prop-types';
class HelloWorld extends React.Component {
  render () {
    return (
      <>
        Greeting: {this.props.greeting} <a href="/">Home</a>
      </>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string,
};

export default HelloWorld;
