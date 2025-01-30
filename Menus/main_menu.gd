extends Control
## The main menu scene.
##
## Let's the player start the game or exit the game.
## More functionality to come.

func _on_btn_start_pressed() -> void:
	SceneManager.load_new_scene(SceneManager.SceneName.TEST_STAGE)


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
