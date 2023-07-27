extends Node2D

@onready var button := $Button
@onready var train := preload("res://train.tscn")
@onready var panda := $Panda
@onready var trainSpawn := $TrainSpawn
@onready var roadAnimation := $Street/AnimationPlayer
@onready var spawner := $Obstacles/Spawner
@onready var scoreChecker := $ScoreChecker

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button.visible && Input.is_action_just_pressed("train"):
		var trainInst = train.instantiate()
		trainInst.add_to_group("train")
		panda.visible = false
		button.visible = false
		trainInst.global_position = trainSpawn.global_position
		add_child(trainInst)
		roadAnimation.speed_scale = 2
		spawner.timer.wait_time = .6
		spawner.speed = 650
		trainInst.train_freed.connect(_reset_stuff)
	
func _reset_stuff():
	roadAnimation.speed_scale = 1
	spawner.timer.wait_time = 1.2
	scoreChecker.currentJump = 0
	spawner.speed = 500
	panda.visible = true
	panda.invincible = true
	panda.get_child(4).start()

