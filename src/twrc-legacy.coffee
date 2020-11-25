import normalize from './utils/normalize.coffee'
import isChecksumValid from './utils/is-twid-checksum-valid.coffee'

###*
Validate ID number of Taiwan Resident Certificate (Uniform ID Numbers).
Only validate ID in or before 2020.
@module core/twrc
@param {string} id
@return {boolean}

Format of the id: AB12345678

In Taiwan, there is another system called National Identification Card
@see module:core/twid-legacy
###
export default (id) ->
	# isLengthValid = (id) -> id.length is 10
	isFormatValid = (id) -> /^[A-Z][A-D][0-9]{8}$/.test(id)

	id = normalize(id)
	# return isLengthValid(id) and isFormatValid(id) and isChecksumValid(id, 2)
	return isFormatValid(id) and isChecksumValid(id, 2)
