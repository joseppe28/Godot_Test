class_name Enemy extends Node2D

@export var health = 10
@export var speed = 50 
@export var exp = 1 
var dead = false
var stopped = false
var delete = 30
var time = 0

func _ready() -> void:
	health = health * PlayerManager.diff
	speed = speed * PlayerManager.diff

func death():
	$AnimatedSprite2D.play("death")
	await $AnimatedSprite2D.animation_finished
	EnemyManager.count -= 1
	dead = true
	PlayerManager.deactivate(self)
