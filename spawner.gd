extends Node2D

@onready var trash = preload("res://trash.tscn")
@onready var stop = preload("res://stop.tscn")
@onready var timer = $Timer

var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var ran = randi_range(0,1)
	var spawnObj
	if ran == 0:
		spawnObj = trash.instantiate()
	if ran == 1:
		spawnObj = stop.instantiate()
	spawnObj.global_position = global_position
	spawnObj.speed = speed
	spawnObj.add_to_group("objs")
	get_parent().add_child(spawnObj)
