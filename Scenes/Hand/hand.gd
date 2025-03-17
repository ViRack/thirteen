extends Panel

const CARD = preload("res://Scenes/Card/card.tscn")
const CARD_BACK_1 = preload("res://Assets/UI/card-back1.png")


@export var is_ai: bool = false


const MAX_HAND_SIZE = 13
const CARD_SPACING: float = 30

var cards: Array[Card] = []
var selected_cards: Array[Card] = []


# Called when the node enters the scene tree for the first time.
func _ready():
	draw_hand()
	
	if is_ai:
		hide_cards()
	else:
		SignalManager.on_card_selected.connect(on_card_selected)


func draw_hand() -> void:
	for i in range(MAX_HAND_SIZE):
		add_card()
	
	pass


func add_card() -> void:
	var new_card = CARD.instantiate()
	new_card.initialize(ImageManager.get_next_card())
	new_card.position = Vector2(CARD_SPACING * cards.size(),0)
	add_child(new_card)
	
	if is_ai == false:
		new_card.set_selectable(true)
	
	
	cards.append(new_card)
	animate_card(new_card)


func animate_card(card: Card) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(card, "position:y", -60, .5)
	tween.tween_property(card, "position:y", -30, .3)



# adds or subtracts cards from selected pile
func toggle_card_selection(selected_card: Card) -> void:
	if selected_cards.has(selected_card):
		selected_cards.erase(selected_card)  # Remove if it exists
		print("Value removed:", selected_cards)
	else:
		selected_cards.append(selected_card)  # Add if it doesn't exist
		print("Value added:", selected_cards)


# when 
func on_card_selected(selected_card: Card) -> void:
	toggle_card_selection(selected_card)


func hide_cards() -> void:
	var random_frame_image_index = randi_range(0,3)
	for card in cards:
		card.texture_normal = ImageManager.FRAME_IMAGES[random_frame_image_index]
	pass


func get_selected_cards() -> Array:
	if selected_cards.size() > 0:
		return selected_cards
	return []
