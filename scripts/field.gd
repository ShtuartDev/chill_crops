extends AnimatedSprite2D

var selected = false
@onready var field: AnimatedSprite2D = $"."

func _ready() -> void:
	frame = 1
	
func _process(_delta: float) -> void:
	if selected:
		field.self_modulate.a = 0.7
	else:
		field.self_modulate.a = 1

func grow():
	if frame == 3:
		frame+=1

func working():
	if 5 <= Globals.actions_left and selected:
		if frame == 0:
			frame+=1
			Globals.actions_left-=5
		elif frame == 1:
			frame+=1
			Globals.actions_left-=5

func planting():
	if 3 <= Globals.actions_left and selected:
		if frame == 2:
			frame+=1
			Globals.actions_left-=3

func harvesting():
	if 1 <= Globals.actions_left and selected:
		if frame == 4:
			frame = 2
			Globals.wheat+=1
			Globals.actions_left-=1

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("ui_click"):
		for i in get_tree().get_nodes_in_group("field"):
			i.selected = false
		selected = true
		if selected:
			print(name+" selected")
