extends Node

var RichPresence
onready var GodotRichPresence = load("res://bin/librichpresence.gdns")

func _ready():
	RichPresence = GodotRichPresence.new()
	
	# SIGNALS
	RichPresence.connect("ready", self, "onRichPresenceReady")
	RichPresence.connect("disconnected", self, "onRichPresenceDisconnected")
	RichPresence.connect("error", self, "onRichPresenceError")
	RichPresence.connect("join_game", self, "onRichPresenceJoinGame")
	RichPresence.connect("join_request", self, "onRichPresenceJoinRequest")
	RichPresence.connect("spectate_game", self, "onRichPresenceSpectateGame")
	
	initialize()
	update_richpresence()

func initialize():
	RichPresence.init({
		"app_id": "345229890980937739"
	})

func update_richpresence():
	RichPresence.update({
		"state": "Paraná",
		"details": "Sul do Brasil",
		"large_image_key": "canary-large",
		"small_image_key": "ptb-small",
	})

func onRichPresenceReady(user):
	print(" ======= READY ======= ")
	print("USERID: ", user["user_id"])
	print("USERNAME: ", user["username"])
	print("DISCRIMINATOR: ", user["discriminator"])
	print("AVATAR: ", user["avatar"])

func onRichPresenceDisconnected(code, message):
	print(" ======= DISCONNECTED ======= ")
	print("CODE: " + str(code))
	print("MESSAGE: " + message)
	
func onRichPresenceError(code, message):
	print(" ======= ERROR ======= ")
	print("CODE: " + str(code))
	print("MESSAGE: " + message)
	update_richpresence()

func onRichPresenceJoinGame(secret):
	print(" ======= JOIN GAME ======= ")
	print("SECRET :", secret)

func onRichPresenceJoinRequest(requestUser):
	print("======= JOIN REQUEST ======= ")
	print("USERID: ", requestUser["user_id"])
	print("USERNAME: ", requestUser["username"])
	print("DISCRIMINATOR: ", requestUser["discriminator"])
	print("AVATAR: ", requestUser["avatar"])

func onRichPresenceSpectateGame(secret):
	print(" ======= SPECTATE GAME ======= ")
	print("SECRET: ", secret)

func run_callbacks():
	RichPresence.run_callbacks()

func shutdown():
	RichPresence.shutdown()