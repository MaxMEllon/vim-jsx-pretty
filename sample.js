class Hoge extends React.Component {
  constructor(props) {
    super(props);
    this.state = { };
  }

  renderHoge() {
    return (
      <div
        foo={
          <bar />
        }
      >
        <span>hoge</span>
      </div>
    );
  }

  render() {
    return (
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
