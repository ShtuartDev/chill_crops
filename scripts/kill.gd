extends Panel

@onready var label_3: Label = $Label3

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	label_3.text = "Managed "+str(Globals.day)+" days"

func _on_quit_pressed() -> void:
	get_tree().quit()
