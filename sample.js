class Hoge extends React.Component {
  constructor(props) {
    super(props);
    this.state = { };
    if ( foo <= 300 ) {

    }
  }

  renderHoge() {
    return (
      <div
        foo={
          <bar foo='aaa' >
            <div
              hoge={
                <div></div>
              }
            />
          </bar>
        }
      >
        <span>hoge</span>
      </div>
    );
  }

  render() {
    return (
      <div>
      </div>
      <div>
        {(hoge => {
          if (hoge) {
            return <div />;
          }
        })()}
      </div>
    );
  }
}

const hoge = () => {
  ReactDOM.render(
    <div></div>,
    document.getElementById('body');
  );
}

export default Hoge;
