extends Node2D


var shoot


var bulletScean: PackedScene = preload("res://scenes/prjectiles/bullet/bullets.tscn")


func _process(_delta):
	if Globals.night and Globals.timeDay == 5:
		toDay()
	if !Globals.night and Globals.timeDay == 10:
		toNight()
		



func _on_player_shoot(pos, direction):
	shoot = bulletScean.instantiate() as Area2D
	shoot.position = pos
	shoot.rotation_degrees = rad_to_deg(direction.angle()) + 90
	shoot.direction = direction
	
	$projectiles.add_child(shoot)

func toDay():
	var tween = get_tree().create_tween()
	tween.parallel() 
	tween.tween_property($ground/ligher,"energy",1,5)
	tween.tween_property($ground/darker,"energy", 0, 5)
func toNight():
	var tween = get_tree().create_tween()
	tween.parallel() 
	tween.tween_property($ground/ligher,"energy",0,10)
	tween.tween_property($ground/darker,"energy", .8, 10)



func _on_ui_new_game():
	get_tree().reload_current_scene()


func _on_ui_leave():
	get_tree().quit()
