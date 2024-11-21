shader_type spatial;

void vertex() {}
void fragment() {
    ALBEDO = vec3(0.0, 0.0, 0.0);
	ROUGHNESS = 1.;
	RIM = 0.001;
}
