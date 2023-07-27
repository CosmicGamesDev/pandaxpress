extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -500.0
var invincible = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("objs") && !invincible:
		get_tree().reload_current_scene()


func _on_timer_timeout():
	invincible = false
