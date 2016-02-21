window.renderApp = function(){
  ReactDOM.render(
    <Container loggedIn={false} />,
    document.getElementById('container')
  );
};
