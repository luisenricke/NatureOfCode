PFont font;

int countCats = 0;
String [] words = {"Dog", "Cat", "Bear", "Frog"};

void setup() {
  size(640, 320);
  font = createFont("Arial", 16, true);  // Arial, 16 point, anti-aliasing on
}

void draw() {
  background(255);                       // Cleaning screen

  textFont(font, 36);                    // Size text
  fill(0);                               // Color text
  String aux =randomPets(words.length); 
  text(aux, 10, 50);
  text("Cat counter: " + countCats, 10, 90);

  if (aux == "Cat") {
    countCats++;
    background(255);

    text("Cat counter: " + countCats, 10, 90);
    text("Press one key to continue", 10, 50);
    noLoop();
  }

  delay(300);
}

void keyPressed() {
  if (looping) noLoop();
  else        loop();
}

String randomPets(int lengthList) {
  return words[int(random(lengthList))];
}
