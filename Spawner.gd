extends Area2D

var row = preload("res://Row.tscn")
var coolingDown = false
var startingPosition = null

func _ready():
	startingPosition = position
	randomize()

func _physics_process(delta):
	var overlaps = get_overlapping_areas()
	if (overlaps != [] || coolingDown):
		return
	
	var newRow = row.instance()
	newRow.position.y = 0 - newRow.boxHeight
	newRow.lane = randi() % 4
	get_parent().add_child(newRow)
	coolingDown = true

func _on_Timer_timeout():
	coolingDown = false
