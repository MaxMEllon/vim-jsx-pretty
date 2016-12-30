class Hoge extends React.Component {
  constructor(props) {
    super(props);
    this.state = { };
    if (foo <= 300) {
      return <div style={{margin:0}}>
        Hello world
      </div>
    }
  }

  hoge() {
    Hoge.poge(
      <div>
        <div></div>
        {this.hoge}
        <div></div>
      </div>
    );
  }

  renderHoge() {
    return (
      <div
        foo={
          <bar foo='aaa' >
            <div
              hoge={
                <div
                  hoge={'aaa'}
                ></div>
              }
            />
          </bar>
        }
      >
        <span>hoge</span>
      </div>
    );
  }

  test() {
    return (
      <div>
        <Input a='a' />
        <Button onClick={this.kepe.bind(this)} />
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

export const Hoge = () => (
  <div>
    <div
      hoge={aaa}
      hoge={aaa}
    ></div>
    <div
      hoge={aaa}
      hoge={aaa}
    />
  </div>
)

ReactDOM.render(
  <div>
    <div></div>
    <div></div>
    <div></div>
  </div>,
  document.getElementById('body');
)

const hoge = () => {
  ReactDOM.render(
    <div></div>,
    document.getElementById('body');
  );
}

export default Hoge;
