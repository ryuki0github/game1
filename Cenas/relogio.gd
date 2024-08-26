extends Area2D

@onready var control = $"../CanvasLayer/Control"

func _on_body_entered(body):
	control.segundos +=5
	await $CollisionShape2D.call_deferred("queue_free")
