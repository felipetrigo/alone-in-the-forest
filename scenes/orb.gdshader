shader_type spatial;

void vertex() {
	VERTEX.x += sin(TIME*6.)/10.;
	VERTEX.z += sin(TIME*4.)/10.;
	VERTEX.y += sin(TIME*1.)/10.;
}
void fragment() {
    ALBEDO = vec3(1, 1, 1);
	ROUGHNESS = 1.;
	RIM = 0.001;
}
