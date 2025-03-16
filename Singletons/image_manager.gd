extends Node


const FRAME_IMAGES: Array[Texture2D] =[
	preload("res://Assets/UI/card-back1.png"),
	preload("res://Assets/UI/card-back2.png"),
	preload("res://Assets/UI/card-back3.png"),
	preload("res://Assets/UI/card-back4.png")
]


var _card_images: Array[CardImage] = []


func _ready():
	var image_resource: ImageFilesList = load("res://Resources/image_files_list.tres")
	for file_path in image_resource.get_file_names():
		add_file_to_list(file_path)
	
	shuffle_images()


#takes in a string with a file path to a card image, sets a new CardImage and 
# inserts it into our _card_images array
#  called by _ready()
func add_file_to_list(file_path: String) -> void:
	var new_card_image: CardImage = CardImage.new(
		file_path.get_file(),
		load(file_path)
	)
	_card_images.append(new_card_image)


#returns a CardImage from the back of our _card_images array
func get_next_card() -> CardImage:
	return _card_images.pop_back()


#returns a texture2D of the back of the card
func get_frame_image(player_number: int) -> Texture2D:
	return FRAME_IMAGES[player_number]


#shuffles out _card_images array
# called by ready
func shuffle_images() -> void:
	_card_images.shuffle()
