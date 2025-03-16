extends Resource

class_name ImageFilesList

@export var file_names: Array[String]

func add_file_name(file_name: String) -> void:
	if !'.import' in file_name:
		file_names.append(file_name)


func get_file_names() -> Array[String]:
	return file_names
