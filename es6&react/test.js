function* f() {
    for(var i = 0; true; i++) {
      var reset = yield i;
      if(reset) { i = -7; }
    }
  }
  
  var g = f();
  const {log:l}=console;

  l(g.next()) // { value: 0, done: false }
  l(g.next()) // { value: 1, done: false }
  l(g.next(true)) // { value: -6, done: false }