extends Area2D

@export var damage = 5
@export var speed = 100
@export var hitable = true

var delete = 100/speed
var time = 0

func _physics_process(delta):
	var x = cos(rotation) * speed
	var y = sin(rotation) * speed
	
	position.x += x
	position.y += y 
	time += delta 
	if time >= delete:
		deactivate()



func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		EnemyManager.damage(body, damage)
		if hitable and process_mode:
			set_process(false)
			hide()

func deactivate():
	set_process(false)
	$CollisionShape2D.disabled = true
	hide()
