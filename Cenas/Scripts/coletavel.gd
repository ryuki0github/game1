extends Area2D

class_name Coletavel
var pontos = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("item")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if body.name == ("Player"):
		Global.pontos += pontos
		print(Global.pontos) 
		$AnimatedSprite2D.play("coletado")
		await $AnimatedSprite2D.animation_finished
		queue_free()
	
