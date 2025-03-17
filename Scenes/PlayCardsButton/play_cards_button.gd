extends TextureButton




@onready var draw_pile = $"."
@onready var hand = $Hand


var selected_cards: Array[Card] = []


func _on_pressed():
	for card in hand.get_selected_cards():
		selected_cards.append(hand.get_selected_cards()[card])
	
	
	print(selected_cards)
