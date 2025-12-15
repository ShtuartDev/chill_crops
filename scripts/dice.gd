extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

var dice_roll : int

func _ready() -> void:
	randomize()

func roll():
	animation_player.play("roll")
	timer.start()

func _on_timer_timeout() -> void:
	dice_roll = randi_range(1,6)
	print(dice_roll)
	animation_player.play(str(dice_roll))
