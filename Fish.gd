extends Node2D

var movement_speed = 4
var movement_time = 1

var min_distance = 100
var max_distance = 200

var min_position = 20
var max_position = 290

func _ready():
	plan_move()
	
func plan_move():
	var target = rand_range(min_position, max_position)
	
	while (abs(self.position.y - target) < min_distance or abs(self.position.y - target) > max_distance):
		target = rand_range(min_position, max_position)
		
	move(Vector2(self.position.x, target))

	
func move(target):
	$Tween.interpolate_property(self, "position", position, target, movement_speed, Tween.TRANS_QUINT, Tween.EASE_OUT)
	$Tween.start()
	
	$MoveTimer.set_wait_time(movement_time)
	$MoveTimer.start()

func destroy():
	get_parent().remove_child(self)
	queue_free()
func timeout():
	plan_move()
