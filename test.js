import React from 'react';

function test() {
  const a = 1;
  let foo;
  foo = (<div key={1}>after parenthesis</div>);
  foo = [<div key={1}>after bracket</div>, <div key={2}>after ,</div>];
  foo = [
    <div key={1}>after bracket</div>,
    <div key={2}>after ,</div>
  ];
  // corner case
  foo = (

    <div>
      {<div>after open brace</div>}
      <div>after close brace</div>
      <div>
        <div>test nested</div>
      </div>
    </div>
  );

  foo = a > 0 ? <div>after ?</div> : <div>after :</div>;
  foo = <div>after =</div>;
  foo = a + <div>after +</div>;
  foo = a - <div>after -</div>;
  foo = a * <div>after *</div>;
  foo = a / <div>after /</div>;
  foo = a && <div>after &&</div>;
  foo = a || <div>after ||</div>;
  foo = [].map(x => <div key={x}>after arrow function</div>);

  foo = a > <div>after greater than</div>;
  foo = a < <div>after less than</div>;
  // return <div></div>
  // corner case
  if (a
    < 0) {
    a = b
  }

  // corner case
  var a = a
    < b / a ? b : a;

  // correct
  foo = <br />

  // corner case
  if (a
    < foo
  ) {
    a = b
  }

  foo = <>fragment</>;
  foo = <div>[<div>fragment</div>]</div>;
  foo = <foo.bar>support membership element</foo.bar>;
  foo = <xml:svg>support namespace element</xml:svg>;

  async function testAwait() {
    await <div>after await</div>;
  }

  function *testYield() {
    yield <div>after yield</div>;
  }

  if (foo ||
    <div></div>
  ) {
    foo = <bar />
  }

  // should not match this
  foo = 1 <a
  foo = foo>a
  foo = <div>hello, world</div>
  var c = a < foo

  return <div>
    plain text<br />plain text<br />
    plain text<br /><div >plain text</div>some text <br />
    plain text<div>after plain text</div>
    {foo ? <div>after question mark</div> : <div>after colon</div>}plain text<div>after plain text</div>
    <div><div>after element</div></div>
  </div>;
}

function test2() {
  return (
    <>
      < div foo="foo, bar">
        <div className="aaa, aaaa, aaaaaa">text</div>
        <div>{[1, 2].map(x => <span>{ x / 2 }</span>)}</div>
      </div>

      <div foo>
        {(hoge => {
          if (hoge) {
            return <div foo-bar foo/>;
          }
        })()}
      </div>
    </>
  );
}

function tagFollowsPlainText() {
  return (
    <div>
      plain text<br />
      <Input type="checkbox" /> Option 1 <br />
      <Input type="checkbox" /> Option 2 <br />
      <Input type="checkbox" /> Option 3 <br />
      <Input type="checkbox" /> Option 4 <br />
    </div>
  );
}

function testComment() {
  return <div>
    <div
      hoge
      foo:bar="hello"
      hoge="string"
      hoge={foo > 0 ? 'foo' : 'bar'} // inline comment
      hoge={aaa} /* multiline comment */
      hoge=<div>valid</div> // according to the jsx spec, this is equal to {<div></div>}
      hoge=<br /> // this is equal to {<br />}
      {...this.props}
    >
      {...testComment()}
    </div>
    <div
      hoge={aaa}
      hoge={aaa}
    />
    {foo && <div>foo</div>}
    {(function () {
      return <div>nested</div>
    })()}
  </div>;
}

function testComponentName() {
  // shouldn't get a jsxComponentName on just Line here
  let x = <flatLine />
    return (
      <FlatList
        style={{display: 'none', fontSize: 100}}
        data={[{ key: "test", icon: <Icon style={APPICON} icon="test" /> }]}
        numColumns={4}
        horizontal={false}
        renderItem={({ item }) => (
          <View>
            <View.Icon>
              {item.icon}
            </View.Icon>
          </View>
        )}
      />
    )
}

export default <div>after default</div>;
