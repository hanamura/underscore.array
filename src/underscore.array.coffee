_a = {}



_a.select = select = (arr, key, def = undefined) ->
	for val in arr
		if key of val then val[key] else def

_a.dig = dig = (arr, keys, def = undefined) ->
	for val in arr
		ks = keys.slice()

		while ks.length
			k = ks.shift()
			if k of val
				val = val[k]
			else
				val = def
				break
		val

_a.rotate = rotate = (arr, count) ->
	arr = arr.slice()

	while count < 0
		count += arr.length
	count %= arr.length

	if count
		arr.splice(0, 0, arr.splice(arr.length - count, count)...)
	arr

_a.equal = equal = (a, b, pred = undefined) ->
	if a.length == b.length
		for i in [0...a.length]
			if pred and !pred(a[i], b[i])
				return false
			else if !pred and a[i] != b[i]
				return false
		true
	else
		false

_a.same = same = (a, b, pred = undefined) ->
	if a.length == b.length
		b = b.slice()

		for va in a
			if pred
				index = -1
				for i in [0...b.length]
					vb = b[i]
					if pred(va, vb)
						index = i
						break
			else
				index = b.indexOf(va)

			if index >= 0
				b.splice(index, 1)
			else
				return false
		true
	else
		false

_a.pick = pick = (arr) ->
	arr[Math.floor arr.length * Math.random()]

_a.pickSome = pickSome = (arr, len) ->
	a = []
	for i in [0...len]
		if !a.length
			a = arr.slice()
		index = Math.floor(a.length * Math.random())
		a.splice(index, 1)[0]



_a.exports = ->
	r = {}
	for k, v of _a
		r[k] = v
	r



if module?.exports?
	module.exports = _a
else
	@_ ||= {}
	oldArray = @_.array
	oldArr = @_.arr
	@_.array = @_.arr = _a
	_a.noConflict = =>
		@_.array = oldArray
		@_.arr = oldArr
		_a