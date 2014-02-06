_a = require '../src/underscore.array.coffee'
expect = require('chai').expect

describe 'underscore.array', ->
	it 'take', ->
		a = [
			{name: 'foo', count: 10}
			{name: 'bar', count: 20}
			{name: 'baz'}
		]
		expect(_a.take a, 'name').to.deep.equal ['foo', 'bar', 'baz']
		expect(_a.take a, 'count').to.deep.equal [10, 20, undefined]
		expect(_a.take a, 'count', 0).to.deep.equal [10, 20, 0]

	it 'dig', ->
		a = [
			{item: elem: name: 'foo'}
			{item: elem: name: 'bar'}
			{item: elem: name: 'baz'}
			{item: null}
		]
		expect(_a.dig a, ['item']).to.deep.equal [{elem: name: 'foo'}, {elem: name: 'bar'}, {elem: name: 'baz'}, null]
		expect(_a.dig a, ['item', 'elem']).to.deep.equal [{name: 'foo'}, {name: 'bar'}, {name: 'baz'}, undefined]
		expect(_a.dig a, ['item', 'elem', 'name'], 'DEF').to.deep.equal ['foo', 'bar', 'baz', 'DEF']

	it 'rotate', ->
		expect(_a.rotate [0...5], 1).to.deep.equal [4, 0, 1, 2, 3]
		expect(_a.rotate [0...5], -2).to.deep.equal [2, 3, 4, 0, 1]
		expect(_a.rotate [0...5], 0).to.deep.equal [0...5]

	it 'equal', ->
		expect(_a.equal [0, 1, 2], [0, 1, 2]).to.be.true
		expect(_a.equal [0, 1, 2], [1, 0, 2]).to.be.false
		expect(_a.equal \
			[{id: 1}, {id: 2}, {id: 3}],
			[{id: 1}, {id: 2}, {id: 3}],
			(a, b) -> a.id is b.id
		).to.be.true

	it 'same', ->
		expect(_a.same [0, 1, 2], [0, 1, 2]).to.be.true
		expect(_a.same [0, 1, 2], [1, 0, 2]).to.be.true
		expect(_a.same \
			[{id: 1}, {id: 2}, {id: 3}],
			[{id: 2}, {id: 1}, {id: 3}],
			(a, b) -> a.id is b.id
		).to.be.true

	it 'sample', ->
		a = [0...10]
		for i in [0...10000] then expect(a).to.contain _a.sample a

	it 'samples', ->
		a = [0...10]
		for i in [0...10000]
			expect(_a.samples a, 3).is.an 'array'
			expect(_a.samples a, 3).to.have.length 3
			expect(a).to.contain r for r in _a.samples a, 3
