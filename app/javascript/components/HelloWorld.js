import React from "react"
import PropTypes from "prop-types"
// class HelloWorld extends React.Component {
//   render () {
//     return (
//       <React.Fragment>
//         Greeting: {this.props.greeting}
//       </React.Fragment>
//     );
//   }
// }

// HelloWorld.propTypes = {
//   greeting: PropTypes.string
// };
// export default HelloWorld
const HelloWorld = (props) => {
  return (
    <> Greeting: {props.greeting}
      <a href="/tester">Test</a>
    </>)
}
export default HelloWorld