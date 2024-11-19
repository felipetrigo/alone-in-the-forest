shader_type spatial;

render_mode blend_mix

uniform vec3 color1 = Color(1.0, 0.0, 0.0)
uniform vec3 color2 = Color(0.0, 1.0, 0.0)
uniform float layer_weight = 0.5

void fragment() {
    // Simulando o Color Ramp:
    float ramp_value = smoothstep(0.0, 0.5, layer_weight); // Ajustar os valores para o seu Color Ramp específico

    // Misturando as cores:
    vec3 final_color = mix(color1, color2, ramp_value);
    ALBEDO = final_color;
}

void vertex() {
	// Called for every vertex the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
