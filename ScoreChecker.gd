extends Area2D


@onready var score := $"../Score"
@onready var button := $"../Button"
var currentScore = 0
var currentJump = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.get_parent().is_in_group("objs"):
		currentScore += 10
		score.text = str(currentScore)
	if currentJump < 5 && area.get_parent().is_in_group("objs"):
		currentJump += 1
	if currentJump == 5 && area.get_parent().is_in_group("objs"):
		button.visible = true
