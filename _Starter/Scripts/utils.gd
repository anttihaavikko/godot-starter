@abstract class_name Utils

static func distinct_array(array: Array) -> Array:
	var unique := []
	for item in array:
		if not unique.has(item):
			unique.push_back(item)
	return unique