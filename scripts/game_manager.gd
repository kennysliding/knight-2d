extends Node

@onready var score_label: Label = $"../Player/Camera2D/ScoreLabel"

var score = 0

func picked_up(_score: int):
	score += _score
	score_label.text = "You collected {score} coins".format({
		"score": score
	})
