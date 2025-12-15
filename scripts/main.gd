extends Node2D

@onready var dice: Sprite2D = $dice
@onready var dice_2: Sprite2D = $dice2
@onready var fields = get_tree().get_nodes_in_group("field")
@onready var shop: Panel = $shop
@onready var tutorial: Control = $tutorial
@onready var kill: Panel = $kill

func _ready() -> void:
	shop.visible = false
	tutorial.visible = false
	kill.visible = false

func _on_end_turn_pressed() -> void:
	if Globals.blanky >= Globals.req_blanky:
		for i in fields:
			if i.frame>1:
				i.field.self_modulate.a = 0.7
				await dice.roll()
				await dice_2.roll()
				
				await get_tree().create_timer(1).timeout
				
				var d1=dice.dice_roll
				var d2=dice_2.dice_roll
				
				if d1==1 and d2==1:
					for j in fields:
						if j.frame>1:
							j.frame=0
					break
				elif d1==6 and d2==6:
					for j in fields:
						if j.frame>1:
							j.frame=4
					break
				else:
					i.grow()
				await get_tree().create_timer(2).timeout
		Globals.actions_left = Globals.max_actions
		Globals.day+=1
		if Globals.day%7==0 and Globals.day>0:
			if Globals.req_blanky==0:
				Globals.req_blanky+=1
			else:
				Globals.req_blanky*=2
	else:
		kill.visible = true

func _on_harvest_pressed() -> void:
	for i in fields:
		i.harvesting()

func _on_plant_pressed() -> void:
	for i in fields:
		i.planting()

func _on_work_pressed() -> void:
	for i in fields:
		i.working()

func _on_shopb_pressed() -> void:
	shop.visible = !shop.visible

func _on_tut_pressed() -> void:
	tutorial.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()
