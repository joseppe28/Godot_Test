extends Node2D

var level = 0
var max_level = 2
var speed = 50 * PlayerManager.diff
var time = 0
var last_minute = 0
var new_enemy = 0
var msec
var seconds
var minutes
var killCount = 0

var spells = {"Electric_Field": 0,
				"Earthquake": 0,
				"Posion_Flask": 0,
				"Fire_Fist": 0,
				"Push": 0,
				"Magic_Sword": 0,
				"Whirlpool_spawner": 0,
				"windblade": 0,
				"Ice_Spikes": 0,
				"Summon": 0}

#var spells = {"Fire_Fist": 0,
#					"Ice_Spikes": 0,
#					"Summon": 0}

func _ready() -> void:
	spells[PlayerManager.weapon.name] += 1
	EnemyManager.enemies = []

func _physics_process(delta):
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	PlayerManager.time = time
	if minutes > last_minute + 1:
		last_minute = minutes
		speed += speed * 0.05
	if minutes > new_enemy + 2 and not level == max_level:
		new_enemy = minutes
		level += 1
		
