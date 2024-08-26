extends Area2D
var pontos = 5



func _on_body_entered(body):
	if body.name ==  "Player":
		Global.pontos += pontos
		print(Global.pontos) 
