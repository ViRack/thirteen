extends Node


const PATH: String = "res://Assets/Playing Cards/"



# Called when the node enters the scene tree for the first time.
func _ready():
	var dir: DirAccess = DirAccess.open(PATH)
	 
	if dir:
		var files: PackedStringArray = dir.get_files()
		var image_files_list: ImageFilesList = ImageFilesList.new()
		
		
		for file_name in files:
			image_files_list.add_file_name(PATH + file_name)
		
		ResourceSaver.save(image_files_list, "res://Resources/image_files_list.tres")
