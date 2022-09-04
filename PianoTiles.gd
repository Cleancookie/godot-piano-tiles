extends Node2D

var rows = []
var score = 0

func _ready():
	score = 0

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
	if rows[0].lane == lane:
		score = score + 1
		rows[0].removeRow()
		rows.pop_front()
	else:
		print('wrong lane played')

func _on_Spawner_row_created(newRow):
	print('new row added')
	rows.push_back(newRow)
	for row in rows:
		print(row.lane)
