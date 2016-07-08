class Hoge extends React.Component {
  constructor(props) {
    super(props);
    this.state = { };
  }

  renderHoge() {
    return (
      <div>
        <span>hoge</span>
      </div>
    );
  }

  render() {
    return (
      <div>
        {(hoge => {
          if (hoge) {
            return (<div />);
          }
        })()}
      </div>
    );
  }
}



