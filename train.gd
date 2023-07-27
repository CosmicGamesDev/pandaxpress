extends CharacterBody2D

signal train_freed


func _on_timer_timeout():
	emit_signal("train_freed")
	queue_free()
