PFont font;

DNA [] population = new DNA[100];



void setup() {
  size(640, 320);

  for (int loop = 0; loop<population.length; loop++) {
    population[loop] = new DNA();
  }

  //noLoop();
}

void draw() {
  background(255);    // Cleaning screen

  for (int iteration= 0; iteration<population.length; iteration++) {
    population[iteration].calculateFitness();
  }

  ArrayList<DNA> matingPool = new ArrayList<DNA>();

  for (int loopPopulation = 0; loopPopulation < population.length; loopPopulation++) {
    int auxFitness = int (population[loopPopulation].fitness * 100);
    //println("iteration"+ loopPopulation +" Gene: " + population[loopPopulation].getGene() + " Fitness: " +auxFitness);
    for (int loopFitness = 0; loopFitness < auxFitness; loopFitness++) {
      matingPool.add(population[loopPopulation]);
    }
  }

  for (int loopMonteCarlo = 0; loopMonteCarlo < population.length; loopMonteCarlo++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    DNA partnerA = matingPool.get(a);
    DNA partnerB = matingPool.get(b);
    println("A: "+ partnerA.fitness +" B: " + partnerB.fitness);
    if (partnerB.fitness > partnerA.fitness) {
      println("Throw A");
    } else {
      println("Leave A");
    }
  }

  //delay(300);
}

void keyPressed() {
  if (looping) noLoop();
  else        loop();
}

void prinText(String message, int x, int y) {
  // Global variable -> PFont font;
  // Setup -> font = createFont("Arial", 16, true);  // Config font
  textFont(font, 36);   // Size text
  fill(0);              // Color text
  text(message, x, y);  // Print
}
