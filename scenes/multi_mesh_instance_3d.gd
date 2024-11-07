extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var arvore = get_node("abc")
	var multiMesh = MultiMesh.new()
	multiMesh.mesh = arvore
	multiMesh.transform_format = MultiMesh.TRANSFORM_3D
	multiMesh.instance_count = 500
	var mmi = MultiMeshInstance3D.new()
	mmi.multimesh = multiMesh
	for mesh_index in range(multiMesh.instance_count):
		var position = Transform3D().translated(Vector3(mesh_index*2,10+2,0)).scaled(Vector3(1,1,1))
		multiMesh.set_instance_transform(mesh_index,position)
		var mesh = Mesh.new();
		# criação do collision shape
		var collisionShape = CollisionShape3D.new()
		collisionShape.shape = BoxShape3D.new()
		var collisionNode = StaticBody3D.new()
		collisionNode.transform = position
		collisionNode.add_child(collisionShape)
		mmi.add_child(collisionNode)
	add_child(mmi)
