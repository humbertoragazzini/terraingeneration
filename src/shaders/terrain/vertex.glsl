#include ../includes/simplexNoise2d.glsl
uniform float uPositionFrecuency;
uniform float uStrength;
uniform float uWarpFrecuency;
uniform float uWarpStrength;


float getElevation(vec2 position){
  //float uPositionFrecuency = 0.2;
  float elevation = 0.0;
  //float uStrength = 2.0;
  //float uWarpFrecuency = 5.0;
  //float uWarpStrength = 0.5;

  vec2 warpPosition = position;
  warpPosition += simplexNoise2d(warpPosition * uPositionFrecuency * uWarpFrecuency) * uWarpStrength;
  elevation += simplexNoise2d(warpPosition*uPositionFrecuency)/ 2.0;
	elevation += simplexNoise2d(warpPosition*uPositionFrecuency*2.0)/ 4.0;
  elevation += simplexNoise2d(warpPosition*uPositionFrecuency*4.0)/ 8.0;
	
  float elevationSign = sign(elevation);

  elevation = pow(abs(elevation), 2.0) * elevationSign;
  elevation *= uStrength;
  return elevation;
}

void main(){
 // Neighbours positions
 float shift = 0.01;
 vec3 positionA = position.xyz + vec3(shift, 0.0, 0.0);
 vec3 positionB = position.xyz + vec3( 0.0, 0.0, - shift);

  //Elevation
 float elevation = getElevation(csm_Position.xz);
 csm_Position.y += elevation;
 positionA.y = getElevation(positionA.xz);
 positionB.y = getElevation(positionB.xz);

 // Cross product for final elevation
 vec3 toA = normalize(positionA - csm_Position);
 vec3 toB = normalize(positionB - csm_Position);
 csm_Normal = cross(toA, toB);
}
