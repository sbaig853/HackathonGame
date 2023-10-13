extends CanvasLayer

var tween: Tween
@onready var temp :int = $MarginContainer/TextureProgressBar.value
var night: bool = false 

func _ready():
	$day.start()

func _process(delta):
	if night:
		$MarginContainer/TextureProgressBar.value = $night.time_left*20
		Globals.timeDay = $night.time_left*20
	else:
		$MarginContainer/TextureProgressBar.value = $day.time_left *10
		Globals.timeDay = $day.time_left*10
	
	Globals.night = night
	

func timer():
	pass
	
	


func _on_day_timeout():
	$night.start()
	night = true


func _on_night_timeout():
	$day.start()
	night = false
