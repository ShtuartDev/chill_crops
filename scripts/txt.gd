extends Node

@onready var actions: Label = $actions
@onready var wheat: Label = $wheat
@onready var cash: Label = $cash
@onready var days: Label = $days
@onready var blanky: Label = $blanky
@onready var req_blan: Label = $reqBlan

func _process(_delta: float) -> void:
	actions.text = "action: "+str(Globals.actions_left)+"/"+str(Globals.max_actions)
	wheat.text = "wheat: "+str(Globals.wheat)
	cash.text = "cash: $"+str(Globals.cash)
	days.text = "day: "+str(Globals.day)
	blanky.text = "blankets: "+str(Globals.blanky)
	req_blan.text = "required blankets: "+str(Globals.req_blanky)
