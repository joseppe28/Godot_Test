extends CharacterBody2D


@export var SPEED = 300.0
@export var DASH_SPEED = 1000.0
@export var damage: int

var direction
var direction_up
var last_direction = 0
var enemy
var last_velocity = Vector2(0,0)

var level = 1

func _ready():
	add_child(PlayerManager.weapon)

func _physics_process(_delta):

	for e in $Area2D.get_overlapping_bodies():
		if e.is_in_group("Enemy") and not e.dead and $Timer.is_stopped():
			damaged(1)
			$Timer.start()
	move()
	leveling()
	move_and_slide()



func move():
	direction = Input.get_axis("left", "right")
	direction_up = Input.get_axis("up", "down")
	if not direction == last_direction and not direction == 0:
		last_direction = direction
	if last_direction > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	if direction:
		velocity.x = direction * SPEED
	elif not direction:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_up:
		velocity.y = direction_up * SPEED
	elif not direction_up:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	velocity = velocity.normalized() * SPEED
	if not velocity == Vector2(0,0):
		last_velocity = velocity


func damaged(d):
	PlayerManager.health -= d
	if PlayerManager.health <= 0:
		EnemyManager.enemies = []
		call_deferred("end")

func end():
	get_tree().change_scene_to_file('res://UI/end.tscn')


func leveling():
	if PlayerManager.exp >= PlayerManager.next_level:
		PlayerManager.exp = 0 + PlayerManager.exp-PlayerManager.next_level
		level += 1
		PlayerManager.next_level = PlayerManager.next_level + 10 * level
		var spells = preload("res://UI/Spell_Selection.tscn")
		spells = spells.instantiate()
		add_child(spells)
		get_tree().paused = true
