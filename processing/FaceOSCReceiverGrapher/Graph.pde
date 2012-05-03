int recent = 10;
int minAdapt = 2;
int maxAdapt = 100;

class Graph extends ArrayList {
  float maxValue, minValue;
  boolean watching;
  String name;
  Graph(String name) {
    this.name = name;
    this.watching = true;
    this.maxValue = Float.NEGATIVE_INFINITY;
    this.minValue = Float.POSITIVE_INFINITY;
  }
  void add(float value) {
    if(watching) {
      if(value == Float.NEGATIVE_INFINITY ||
        value == Float.POSITIVE_INFINITY ||
        value != value)
        return;
      if(value > maxValue)
        maxValue = value;
      if(value < minValue)
        minValue = value;
    }
    super.add(value);
  }
  float getFloat(int i) {
    if(size() == 0)
      return 0;
    return ((Float) super.get(i)).floatValue();
  }
  float getLastFloat() {
    return getFloat(size() - 1);
  }
  float normalize(float x) {
    return constrain(norm(x, minValue, maxValue), 0, 1);
  }
  float getNorm(int i) {
    return normalize(getFloat(i));
  }
  float getLastNorm() {
    return getNorm(size() - 1);
  }
  float getLinear(int i) {
    return sqrt(1. / getNorm(i));
  }
  float getLastLinear() {
    return getLinear(size() - 1);
  }
  float mean() {
    float sum = 0;
    for(int i = 0; i < size(); i++)
      sum += getFloat(i);
    return sum / size();
  }
  float recentMean() {
    float mean = 0;
    int n = min(size(), recent);
    for(int i = 0; i < n; i++)
      mean += getFloat(size() - i - 1);
    return mean / n;
  }
  float recentVarianceWeighted() {
    float mean = recentMean();
    float recentVariance = 0;
    int n = min(size(), recent);
    float weights = 0;
    for(int i = 0; i < n; i++) {
      float w = 1. - ((float) i / (float) n);
      recentVariance += abs(getFloat(size() - i - 1) - mean) * w;
      weights += w;
    }
    return recentVariance / weights;
  }
  float recentAdaptive(float adapt) {
    float sum = 0;
    float weights = 0;
    float curRecent = map(adapt, 0, 1, minAdapt, maxAdapt);
    int n = min(size(), 1 + (int) curRecent);
    for(int i = 0; i < n; i++) {
      float w = 1. - ((float) i / (float) n);
      sum += getFloat(size() - i - 1) * w;
      weights += w;
    }
    println(sum + " " + weights + " " + n);
    return sum / weights;
  }
  void draw(int width, int height) {
    fill(getNorm(size() - 1) * 255);
    //rect(0, 0, width, height);
    
    fill(0);
    stroke(0);
    
    textAlign(LEFT, CENTER);
    text(nf(getLastFloat(), 0, 0) + " " + name, 10, height - normalize(recentMean()) * height);
    
    textAlign(LEFT, TOP);
    text(nf(minValue, 0, 0), width - 20, height - 20);
    
    noFill();
    beginShape();
    vertex(0, height);
    for(int i = 0; i < width && i < size(); i++) {
      int position = size() - i - 1;
      vertex(i, height - getNorm(position) * height);
    }
    vertex(width, height);
    endShape();
    
    fill(0);
    textAlign(LEFT, BOTTOM);
    text(nf(maxValue, 0, 0), width - 20, 20);
  }
  void save(String filename) {
    String[] out = new String[size()];
    for(int i = 0; i < size(); i++) 
      out[i] = nf(getFloat(i), 0, 0);
    saveStrings(filename + ".csv", out);
  }
}
