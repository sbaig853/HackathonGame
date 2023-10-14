extends CharacterBody2D

var speed: int  = 100
var direction: Vector2

var health: int = 100
var dmg: int = 25


func _process(delta):
	
	direction = (Globals.playerPos - position).normalized()
	var temp = Vector2(1,0).rotated(direction.angle()) * speed
	print(temp)
	position += temp * delta
	look_at(Globals.playerPos)
	move_and_slide()
	
	
	if health <= 0:
		queue_free()

func hit():
	health -= 50




func _on_area_2d_body_entered(body):
	if "hit" in body:
		body.hit(dmg)
