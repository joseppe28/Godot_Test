extends Area2D

var speed = 10

var delete = 2
var time = 0

var damage
var size

var exploded = false

func _physics_process(delta):
	var x = cos(rotation) * speed
	var y = sin(rotation) * speed
	
	position.x += x
	position.y += y 
	time += delta 
	if time >= delete and not exploded:
		explosion()
	if $Timer.is_stopped() and exploded:
		for body in $Explosion.get_overlapping_bodies():
			if body.is_in_group("Enemy"):
				EnemyManager.damage(body, damage)
		$Timer.start()
	if $delete.is_stopped() and exploded:
		PlayerManager.deactivate(self)


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		explosion()
		
func explosion():
	if not exploded:
		$AnimatedSprite2D.play("Explosion")
		$Potion_light.visible = false
		$Explosion_light.visible = true
	exploded = true
	$Timer.start()
	$delete.start()
	speed = 0
	


func _on_delete_timeout():
	PlayerManager.deactivate(self)
