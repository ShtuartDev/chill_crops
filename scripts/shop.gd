extends Panel

func _on_button_pressed() -> void:
	if Globals.wheat>=3:
		Globals.wheat-=3
		Globals.cash+=3

func _on_button_2_pressed() -> void:
	if Globals.cash>=3:
		Globals.cash-=3
		Globals.max_actions+=2

func _on_button_3_pressed() -> void:
	if Globals.cash>=10:
		Globals.cash-=10
		Globals.blanky+=1

func _on_button_4_pressed() -> void:
	if Globals.cash>=50:
		Globals.cash-=50
		Globals.day-=1
