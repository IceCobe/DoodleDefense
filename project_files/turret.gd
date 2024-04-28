extends Node2D

export(PackedScene) var BULLET: PackScene = null

var target: Node2D = null

onready var bodySprite = $BodySprite
onready var rayCast = $RayCast2D
onready var reloadTimer = $RayCast2D/ReloadTimer

