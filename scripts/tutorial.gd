extends Control

@onready var tutorial: Control = $"."

func _on_back_pressed() -> void:
	tutorial.visible = false
