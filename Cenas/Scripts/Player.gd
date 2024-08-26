extends CharacterBody2D


const SPEED = 350.0 
const JUMP_VELOCITY = -300
var estaPulando = false #para confirmar se está pulando
var is_takingdamage = false
var is_dead = false
var vida = 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal morreu #VAI AVISAR A OUTRO SCRIPT QUE PERSONAGEM MORREU

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta	
		#estaPulando = false
		#$AnimatedSprite2D.play("fall")	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		estaPulando = true		
	elif  is_on_floor(): 
		estaPulando = false		
		

	var direction = Input.get_axis("ui_left", "ui_right")
	
	#movimento
	if direction and !is_takingdamage:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 0.08)
	
	##Animação
	if !is_takingdamage: #se não estiver tomando dano
		if is_on_floor():#SE ESTÁ NO CHÃO
			if estaPulando: #SE ESTÁ PULANDO
				
				$AnimatedSprite2D.play("jump")
			elif direction !=0: #EM MOVIMENTO	
				$AnimatedSprite2D.play("run")
			elif direction ==0: # PARADO
				$AnimatedSprite2D.play("idle")	
		else: #não está no chão
			if velocity.y < 0: #MOVIMENTO EM Y NEGATIVO
				$AnimatedSprite2D.play("jump")	
			else: #MOVIMENTO EM Y NEGATIVO
				$AnimatedSprite2D.play("fall")
	

	move_and_slide() #comando reservado para movimentação
	
func _levouDano(dano):#vai ser chamado quando o personagem levar dano(aramdilha,inimigo,item venenoso,etc)
	#print("Sim, levou dano ;-;")
	#print("hit")
	
	is_takingdamage = true
	velocity.x = -400
	
	$AnimatedSprite2D.play("hitanim")
	await $AnimatedSprite2D.animation_finished
	is_takingdamage = false
	
	vida -= dano
	print("vida:",vida)
	
	if vida <= 0:
		_morreu()
func _morreu():
	is_dead = true
	emit_signal("morreu")


