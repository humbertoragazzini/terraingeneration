uniform uColorWaterDeep;
uniform uColorWaterSurface;
uniform uColorSand;
uniform uColorGrass;
uniform uColorSnow;
uniform uColorRock;



void main(){
  vec3 color = vec3(1.0);

  // Final color
  csm_DiffuseColor = vec4(color,1.0);
}
