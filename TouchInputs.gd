extends Node2D

signal lane1_clicked
signal lane2_clicked
signal lane3_clicked
signal lane4_clicked

func _on_Lane1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("lane1_clicked")

func _on_Lane2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("lane2_clicked")

func _on_Lane3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("lane3_clicked")

func _on_Lane4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("lane4_clicked")
