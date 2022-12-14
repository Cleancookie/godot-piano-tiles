extends Node2D

signal score_changed
var rows = []
var score = 0
export var wrong_note_cooldown = false

func _ready():
	score = 0
	var key = JavaScript.eval('window.player_key')

func _input(event):
	if event.is_action_pressed("note_1"):
		playNote(1)
	elif event.is_action_pressed("note_2"):
		playNote(2)
	elif event.is_action_pressed("note_3"):
		playNote(3)
	elif event.is_action_pressed("note_4"):
		playNote(4)

func playNote(lane):
	if rows == [] || wrong_note_cooldown:
		return
		
	if rows[0].lane == lane:
		score = score + 1
		rows[0].removeRow()
		rows.pop_front()
		emit_signal('score_changed', score)
	else:
		wrong_note_cooldown = true
		$HBoxContainer/WrongNoteWarning.visible = true
		$WrongNoteCooldown.start()

func _on_Spawner_row_created(newRow):
	rows.push_back(newRow)

func _on_TouchInputs_lane1_clicked():
	playNote(1)

func _on_TouchInputs_lane2_clicked():
	playNote(2)

func _on_TouchInputs_lane3_clicked():
	playNote(3)	

func _on_TouchInputs_lane4_clicked():
	playNote(4);

func _on_WrongNoteCooldown_timeout():
	wrong_note_cooldown = false
	$HBoxContainer/WrongNoteWarning.visible = false
