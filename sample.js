class App extends Component {
  render() {
    // NOTCE: no `;` after.
    const arr = <div></div>

    var foo = 'foo';
    if (foo === 'foo') {
      console.log('hello');
    }

    var el = a < 0
      ? <div></div>
      : <a></a>
    var a = (a>b)<a
    var b = el || <div>hello, world</div>
    var c = a<foo
    var d = a<foo
    var e = a>c
    var bar = arr[1] < foo;

    if (a<b && a<d || a>c){
      return <a></a>
    }

    if (a < b ) {
      return b <a ? <div>hello</div>:<a>world</a>
    }

    return b<a?<div>hello</div>:<a>world</a>
  }
}

class Hoge extends React.Component {
  constructor(props) {
    super(props);
    this.state = { };
    if (foo <= 300) {
      return <  div style={{margin:0}}>
        <div>hello, world</div>
        <table.row hello="world">
        </table.row>
      </ div>
    }
  }

  hoge() {
    Hoge.poge(
      <div disabled>
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
      <div className="aaa, aaaa">
        <div className="aaa, aaaa, aaaaaa">

        </div>
      </div>

      <div>
        {(hoge => {
          if (hoge) {
            return <div foo-bar foo/>;
          }
        })()}
      </div>
    );
  }
}

export const Hoge = () => (
  <div>
    <div
      hoge
      hoge={aaa}
      hoge={aaa}
      hoge
    ></div>
    <div
      hoge={aaa}
      hoge={aaa}
    />
    {foo && <div>foo</div>}
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

const SearchBar = ({
  options,
  selected,
  handleSearch
}) => {
  const a = 'hi';
  console.log(a);
}

export default Hoge;
