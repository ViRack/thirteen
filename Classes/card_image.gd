class_name CardImage

var _card_name: String
var _card_texture: Texture2D


func _init(card_name: String, card_texture: Texture2D) -> void:
	_card_name = card_name
	_card_texture = card_texture


func get_texture() -> Texture2D:
	return _card_texture


func get_card_name() -> String:
	return _card_name
