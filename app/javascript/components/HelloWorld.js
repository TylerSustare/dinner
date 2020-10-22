import React from 'react';
import PropTypes from 'prop-types';
class HelloWorld extends React.Component {
  render() {
    return (
      <>
        <p>
          Greeting: {this.props.greeting} <a href="/tester">Test</a>
        </p>
        <p>
          <a href="/meals">Meals</a>
        </p>
      </>
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
