PVector rotX(PVector v, float rad){
  return new PVector(v.x, (v.y * cos(rad)) + (v.z * -sin(rad)), (v.y * sin(rad)) + (v.z * cos(rad)));
}

PVector rotY(PVector v, float rad){
  return new PVector((v.x * cos(rad)) + (v.z * sin(rad)), v.y, (v.x * -sin(rad)) + (v.z * cos(rad)));
}

PVector rotZ(PVector v, float rad){
  return new PVector((v.x * cos(rad)) + (v.y * -sin(rad)), (v.x * sin(rad)) + (v.y * cos(rad)), v.z);
}
