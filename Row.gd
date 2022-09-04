extends KinematicBody2D

export var lane = 1
export var speed = 1600
var laneWidth = 104
var boxHeight = 192
var screen = null
var velocity = null
var boxes = []


func _ready():
	screen = get_viewport().size
	velocity = Vector2.DOWN
	velocity.y = speed
	boxes = [$Box1, $Box2, $Box3, $Box4]

func _physics_process(delta):	
	if (boxes != []):
		boxes[lane-1].visible = true
	
	move_and_collide(velocity * delta, false)
	return

func removeRow():
	queue_free()
