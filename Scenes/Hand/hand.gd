extends Panel

const CARD = preload("res://Scenes/Card/card.tscn")

const MAX_HAND_SIZE = 13
const CARD_SPACING: float = 30


var cards: Array[Card] = []


# Called when the node enters the scene tree for the first time.
func _ready():
	draw_hand()


func draw_hand() -> void:
	for i in range(MAX_HAND_SIZE):
		add_card()
	
	pass


func add_card() -> void:
	var new_card = CARD.instantiate()
	new_card.initialize(ImageManager.get_next_card())
	
	new_card.position = Vector2(CARD_SPACING * cards.size(),0)
	
	add_child(new_card)
	
	cards.append(new_card)
	animate_card(new_card)


func animate_card(card: Card) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(card, "position:y", -30, .5)
	tween.tween_property(card, "position:y", 0, 1)
