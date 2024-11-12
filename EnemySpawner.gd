extends Node2D

var list = ["res://Enemies/runner.tscn",
			"res://Enemies/big_runner.tscn",
			"res://Enemies/fast_runner.tscn"]
var level = 0
var time

func _physics_process(delta):
	level = get_tree().current_scene.level
	time = 100.0 / float(get_tree().current_scene.speed)
	$Timer.wait_time = time


func _on_timer_timeout():
	var rnd = randi_range(0, level)
	var path = list[rnd]
	var enemy = load(path)
	enemy = enemy.instantiate()
	enemy.global_position = global_position
	EnemyManager.enemies.append(enemy)
	EnemyManager.count += 1
	PlayerManager.get_Arena().add_child(enemy)
	
	
	
