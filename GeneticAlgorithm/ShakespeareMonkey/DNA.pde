class DNA {
  String target = "to be or not tobe";
  char[] genes = new char[18];


  float fitness;

  public DNA() {
    for (int loop = 0; loop < genes.length; loop++) {
      genes[loop] = (char) random(32, 128);
    }
  }

  void calculateFitness() {
    int score = 0;
    for (int loop = 0; loop <genes.length-1; loop++) {
      if (genes[loop] == target.charAt(loop)) {
        score++;
      }
    }

    fitness = (float)score / (float)target.length();
  }

  String getGene() {
    return String.valueOf(genes);
  }
}
