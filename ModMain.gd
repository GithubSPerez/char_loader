extends Node

const MOD_PRIORITY = -10000

func installNetworkExtension(childScriptPath:String):
	var childScript = ResourceLoader.load(childScriptPath)
	childScript.new()
	var parentScript = childScript.get_base_script()
	if parentScript == null:
		print("Missing dependencies")

	var parentScriptPath = parentScript.resource_path
	childScript.take_over_path(parentScriptPath)

func _init(modLoader = ModLoader):
    modLoader.installScriptExtension("res://char_loader/AnimationTimings.gd")
    modLoader.installScriptExtension("res://char_loader/CharacterDisplay.gd")
    modLoader.installScriptExtension("res://char_loader/CharacterSelect.gd")
    modLoader.installScriptExtension("res://char_loader/main.gd")
    modLoader.installScriptExtension("res://char_loader/ErrorLabel.gd")
    
    installNetworkExtension("res://char_loader/Network.gd")
    Global.VERSION += " [Online Char Loader " + modLoader._readMetadata("res://char_loader/_metadata")["version"] + "]"

func _ready():
    var btt_scene = load("res://ui/CSS/CharacterButton.tscn").instance()
    btt_scene.set_custom_minimum_size(Vector2(60, 20))
    ModLoader.saveScene(btt_scene, "res://ui/CSS/CharacterButton.tscn")
    print("Char Loader: sorry about all those errors, had to force ModHashCheck to not run otherwise online functionality is impossible\n----------------------------------------------------\n")
    Network.default_chars = len(Global.name_paths)