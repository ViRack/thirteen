extends TextureButton


class_name Card


var suit: String
var rank: int
var value: int
var this_card_image: CardImage
var is_pressed: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _to_string() -> String:
	return "suite: " + suit + " rank: " + str(rank)


#card-clubs-1.png
func initialize(card_image: CardImage) -> void:
	set_card_information(card_image)
	set_card_image(card_image)


#sets this cards information from the information gotten from card_image
func set_card_information(card_image: CardImage) -> void:
	var parts = card_image.get_card_name().replace(".png", "").split("-")
	if parts.size() == 3:
		suit = parts[1]
		rank = int(parts[2])
	
	this_card_image = card_image


#changes the image to the new card_image
func set_card_image(card_image: CardImage) -> void:
	texture_normal = card_image.get_texture()


func set_card_value() -> void:
	pass


func get_card() -> Card:
	return self


func animate_card() -> void:
	if (is_pressed == false):
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "position:y", -30, .1)
		
		is_pressed = true
	else:
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "position:y", 0, .1)
		
		is_pressed = false
	
	SignalManager.on_card_selected.emit(self)




func _on_pressed():
	animate_card()
