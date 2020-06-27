class DNA {
  char[] genes;

  float fitness;

  public DNA(int size) {
    genes = new char[size];
    for (int loop = 0; loop < genes.length; loop++) {
      genes[loop] = (char) random(32, 128);
    }
  }

  void calculateFitness(String target) {
    int score = 0;
    for (int loop = 0; loop <genes.length; loop++) {
      if (genes[loop] == target.charAt(loop)) {
        score++;
      }
    }

    fitness = (float)score / (float)target.length();
  }

  DNA crossover(DNA partner) {
    DNA child = new DNA(genes.length);

    //int midpoint = int(random(genes.length)); // Pick a midpoint
    int midpoint = int(genes.length/2);         // Pick middle

    // Half from one, half from the other
    for (int i = 0; i < genes.length; i++) {
      if (i > midpoint) child.genes[i] = genes[i];
      else              child.genes[i] = partner.genes[i];
    }
    return child;
  }

  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char) random(32, 128);
      }
    }
  }

  String getPhrase() {
    return String.valueOf(genes);
  }
}
