extends "res://main.gd"

var _Global = Network

# this just loads the necessary custom characters through characterSelect.gd
func _on_loaded_replay(match_data):
    _Global.css_instance.net_loadReplayChars([match_data.selected_characters[1]["name"], match_data.selected_characters[2]["name"], match_data])
    match_data["replay"] = true
    _on_match_ready(match_data)