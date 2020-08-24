import React from 'react';
import PropTypes from 'prop-types';
class HelloWorld extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string,
};

// seems like arrow functions break with this setup and prop types. Most likely due to re-rendering 
// const HelloWorld = ( props ) => {
//   return (
//     <>
//       Greeting: {props.greeting}
//       <a href="/tester">Test</a>
//     </>
//   );
// };

export default HelloWorld;
