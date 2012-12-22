(function() {
  var dig, equal, oldArr, oldArray, rotate, same, sample, samples, take, _a,
    __slice = [].slice,
    _this = this;

  _a = {};

  _a.take = take = function(arr, key, def) {
    var val, _i, _len, _results;
    if (def == null) {
      def = void 0;
    }
    _results = [];
    for (_i = 0, _len = arr.length; _i < _len; _i++) {
      val = arr[_i];
      try {
        if (key in val) {
          _results.push(val[key]);
        } else {
          _results.push(def);
        }
      } catch (e) {
        try {
          if (val[key] !== void 0) {
            _results.push(val[key]);
          } else {
            _results.push(def);
          }
        } catch (e) {
          _results.push(def);
        }
      }
    }
    return _results;
  };

  _a.dig = dig = function(arr, keys, def) {
    var k, ks, val, _i, _len, _results;
    if (def == null) {
      def = void 0;
    }
    _results = [];
    for (_i = 0, _len = arr.length; _i < _len; _i++) {
      val = arr[_i];
      ks = keys.slice();
      while (ks.length) {
        k = ks.shift();
        try {
          if (k in val) {
            val = val[k];
          } else {
            val = def;
            break;
          }
        } catch (e) {
          try {
            if (val[k] !== void 0) {
              val = val[k];
            } else {
              val = def;
              break;
            }
          } catch (e) {
            val = def;
            break;
          }
        }
      }
      _results.push(val);
    }
    return _results;
  };

  _a.rotate = rotate = function(arr, count) {
    arr = arr.slice();
    while (count < 0) {
      count += arr.length;
    }
    count %= arr.length;
    if (count) {
      arr.splice.apply(arr, [0, 0].concat(__slice.call(arr.splice(arr.length - count, count))));
    }
    return arr;
  };

  _a.equal = equal = function(a, b, pred) {
    var i, _i, _ref;
    if (pred == null) {
      pred = void 0;
    }
    if (a.length === b.length) {
      for (i = _i = 0, _ref = a.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (pred && !pred(a[i], b[i])) {
          return false;
        } else if (!pred && a[i] !== b[i]) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  };

  _a.same = same = function(a, b, pred) {
    var i, index, va, vb, _i, _j, _len, _ref;
    if (pred == null) {
      pred = void 0;
    }
    if (a.length === b.length) {
      b = b.slice();
      for (_i = 0, _len = a.length; _i < _len; _i++) {
        va = a[_i];
        if (pred) {
          index = -1;
          for (i = _j = 0, _ref = b.length; 0 <= _ref ? _j < _ref : _j > _ref; i = 0 <= _ref ? ++_j : --_j) {
            vb = b[i];
            if (pred(va, vb)) {
              index = i;
              break;
            }
          }
        } else {
          index = b.indexOf(va);
        }
        if (index >= 0) {
          b.splice(index, 1);
        } else {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  };

  _a.sample = sample = function(arr) {
    return arr[Math.floor(arr.length * Math.random())];
  };

  _a.samples = samples = function(arr, len, repeat) {
    var a, i, _i, _results;
    if (repeat == null) {
      repeat = true;
    }
    if (arr.length) {
      a = arr.slice(0);
      _results = [];
      for (i = _i = 0; 0 <= len ? _i < len : _i > len; i = 0 <= len ? ++_i : --_i) {
        if (!a.length) {
          if (repeat) {
            a = arr.slice(0);
          } else {
            break;
          }
        }
        _results.push(a.splice(Math.floor(a.length * Math.random()), 1)[0]);
      }
      return _results;
    } else {
      return [];
    }
  };

  _a.exports = function() {
    var k, r, v;
    r = {};
    for (k in _a) {
      v = _a[k];
      r[k] = v;
    }
    return r;
  };

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    module.exports = _a;
  } else {
    this._ || (this._ = {});
    oldArray = this._.array;
    oldArr = this._.arr;
    this._.array = this._.arr = _a;
    _a.noConflict = function() {
      _this._.array = oldArray;
      _this._.arr = oldArr;
      return _a;
    };
  }

}).call(this);
