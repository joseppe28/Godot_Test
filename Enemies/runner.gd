extends CharacterBody2D

@export var speed: int = 60
var target
@export var health = 10
@export var exp = 1
@export var delete = 100
var time = 0
var stopped = false
var dead = false


func _physics_process(delta):
	if not stopped and is_instance_valid(target):
		var angle = get_angle_to(target.global_position)
		velocity.x = cos(angle) * speed
		velocity.y = sin(angle) * speed
	if not is_instance_valid(target):
		death()
	move_and_slide()
	
	time += delta
	if time >= delete:
		dead = true
		set_process(false)
		hide()

func damage(d):
	health -= d
	if health <= 0 and not dead:
		death()


func death() -> void:
	dead = true
	PlayerManager.get_Arena().killCount += 1
	$AnimatedSprite2D.play("death")
	await $AnimatedSprite2D.animation_finished
	dead = true
	PlayerManager.deactivate(self)
	if self.is_in_group("Enemy"):
		PlayerManager.exp += exp

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		EnemyManager.damage(body, health)
		death()
		
		
