var Container = React.createClass({
  // getInitialState: function() {
  // //   return {login_clicked: false}, {register_clicked: false};
  // // },
  // // handleLoginClick: function (){
  // //   this.setState({login_clicked: true});
  // //   this.render();
  // // },
  // //   handleRegisterClick: function (){
  // //   this.setState({register_clicked: true});
  // //   this.render();
  // },
  render: function (){
    return(
      <div className="matroshka">
        <NavBar />
        <MapDiv  />
      </div>
    );
  }
});


//  onLoginButtonClick={this.handleLoginClick} onRegisterButtonClick={this.handleRegisterClick}
// loginClicked={this.state.loginClicked} registerClicked={this.state.registerClicked}
