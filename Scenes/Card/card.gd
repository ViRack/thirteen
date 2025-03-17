extends TextureButton


class_name Card


var suit: String
var rank: int
var value: int
var this_card_image: CardImage
var is_selected: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _to_string() -> String:
	return "[suite: " + suit + " rank: " + str(rank) + "]"


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


func set_texture(texture: Texture2D) -> void:
	set_texture(texture)


func get_card() -> Card:
	return self


func is_card_selected() -> bool:
	return is_selected 


func animate_card() -> void:
	var current_position = position.y
	if (is_selected == false):
	
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "position:y", current_position -30, .1)
		
		is_selected = true
	else:
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "position:y", current_position + 30, .1)
		
	
		is_selected = false
	
	SignalManager.on_card_selected.emit(self)


func select_card() -> void:
	animate_card()
	print(self)


func _on_pressed():
	animate_card()
