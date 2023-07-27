extends Sprite2D

@onready var hitAnimation = preload("res://hit_animation.tscn")
# Called when the node enters the scene tree for the first time.
var speed = 500
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(Vector2(-100,global_position.y), delta * speed)

 
func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("train"):
		on_hit()

func on_hit():
	var hitAnimationInstance = hitAnimation.instantiate()
	hitAnimationInstance.get_child(1).texture = texture
	hitAnimationInstance.global_position = global_position
	get_parent().get_parent().add_child(hitAnimationInstance)
	hitAnimationInstance.get_child(0).play("default")
	get_parent().get_parent().get_child(7).currentScore += 20
	get_parent().get_parent().get_child(8).text = str(get_parent().get_parent().get_child(7).currentScore)
	queue_free()
