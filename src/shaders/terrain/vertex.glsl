float getElevation(vec2 position){
  float elevation = 0.0;

	return elevation;
}

void main(){
 //Elevation
 float elevation = getElevation(csm_position.xz);
 csm_position.y += elevation;

}
