PFont font;

float mutationRate = 0.01;
int totalPopulation = 150;

DNA [] population;
ArrayList<DNA> matingPool;
String target;

void setup() {
  //noLoop();
  size(820, 200);
  font = createFont("Courier", 16, true);  // Config font

  target ="to be or not to be";
  population = new DNA [totalPopulation];

  for (int loop = 0; loop<population.length; loop++) {
    population[loop] = new DNA(target.length());
  }
}

void draw() {
  for (int iteration= 0; iteration<population.length; iteration++) {
    population[iteration].calculateFitness(target);
  }

  matingPool = new ArrayList<DNA>();

  for (int loopPopulation = 0; loopPopulation < population.length; loopPopulation++) {
    int auxFitness = int(population[loopPopulation].fitness * 100);
    for (int loopFitness = 0; loopFitness < auxFitness; loopFitness++) {
      matingPool.add(population[loopPopulation]);
    }
  }

  for (int loopReproduction = 0; loopReproduction < population.length; loopReproduction++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    DNA partnerA = matingPool.get(a);
    DNA partnerB = matingPool.get(b);
    DNA child = partnerA.crossover(partnerB);
    child.mutate(mutationRate);
    population[loopReproduction] = child;
  }


  background(255);
  fill(0);
  String everything = "";
  for (int i = 0; i < population.length; i++) {
    println(population[i].getPhrase());
    if (population[i].getPhrase() == target) {
      println("Debe de irse");
      exit();
    }
    everything += population[i].getPhrase() + "     ";
  }
  textFont(font, 12);
  text(everything, 10, 10, width, height);

  //delay(100);
}

void keyPressed() {
  if (looping)  noLoop();
  else          loop();
}

void prinText(String message, int x, int y) {
  // Global variable -> PFont font;
  // Setup -> font = createFont("Arial", 16, true);  // Config font
  textFont(font, 36);   // Size text
  fill(0);              // Color text
  text(message, x, y);  // Print
}
