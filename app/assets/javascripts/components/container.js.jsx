var Container = React.createClass({
  getInitialState: function() {
    return loggedIn: false};

  render: function (){
    return(
      <div className="matroshka">
        <NavBar />
        <MapDiv />
      </div>
    );
  }
});
