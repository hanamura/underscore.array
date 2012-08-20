# Underscore.array

## Functions

**take** `_.arr.take(arr, key, def = undefined)`

Collects values by key from each element of `arr`.

```javascript
var arr = [
	{name: 'foo', count: 10},
	{name: 'bar', count: 20},
	{name: 'baz'}
];
_.arr.take(arr, 'name'); // ['foo', 'bar', 'baz']
_.arr.take(arr, 'count', 0); // [10, 20, 0]
```

**dig** `_.arr.dig(arr, keys, def = undefined)`

Collects values by multiple keys from each element of `arr`.

```javascript
var arr = [
	{item: {elem: {name: 'foo'}}},
	{item: {elem: {name: 'bar'}}},
	{item: {elem: {name: 'baz'}}},
	{item: null}
];
_.arr.dig(arr, ['item', 'elem', 'name'], 'DEF'); // ['foo', 'bar', 'baz', 'DEF']
```

**rotate** `_.arr.rotate(arr, count)`

Returns a rotated copy of `arr`.

```javascript
_.arr.rotate([0, 1, 2, 3, 4], 1); // [4, 0, 1, 2, 3]
_.arr.rotate([0, 1, 2, 3, 4], -2); // [2, 3, 4, 0, 1]
```

**equal** `_.arr.equal(a, b, pred = undefined)`

Returns `true` if `a` and `b` have the same elements, the same number of elements, and are in the same order.

You can optionally pass a `pred` function to check equality of elements. The operator `===` is used by default.

```javascript
_.arr.equal([0, 1, 2], [0, 1, 2]); // true
_.arr.equal([0, 1, 2], [1, 0, 2]); // false
_.arr.equal(
	[{id: 1}, {id: 2}, {id: 3}],
	[{id: 1}, {id: 2}, {id: 3}],
	function(a, b) { return a.id === b.id; }
); // true
```

**same** `_.arr.same(a, b, pred = undefined)`

Returns `true` if `a` and `b` have the same elements and the same number of elements (ignores the order).

You can optionally pass a `pred` function to check equality of elements. The operator `===` is used by default.

```javascript
_.arr.same([0, 1, 2], [0, 1, 2]); // true
_.arr.same([0, 1, 2], [1, 0, 2]); // true
_.arr.same(
	[{id: 1}, {id: 2}, {id: 3}],
	[{id: 1}, {id: 2}, {id: 3}],
	function(a, b) { return a.id === b.id; }
); // true
```

**sample** `_.arr.sample(arr)`

Picks a random element from `arr`.

```javascript
_.arr.sample([0, 1, 2, 3, 4]); // 1
_.arr.sample([0, 1, 2, 3, 4]); // 4
_.arr.sample([0, 1, 2, 3, 4]); // 2
```

**samples** `_.arr.samples(arr, len)`

Picks random elements from `arr`.

```javascript
_.arr.samples([0, 1, 2, 3, 4], 3); // [2, 4, 0]
_.arr.samples([0, 1, 2, 3, 4], 3); // [1, 0, 2]
_.arr.samples([0, 1, 2, 3, 4], 3); // [4, 3, 0]
```