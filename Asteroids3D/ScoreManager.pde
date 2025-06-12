class ScoreManager{
   private int score;
   private int highScore;
   private int lastScore;
   private boolean alive;
   
   public ScoreManager(){
      score = 0; 
      highScore = 0;
      alive = false;
   }
   
   public void reset(){
     lastScore = score;
     if (score > highScore) highScore = score;
     score = 0; 
   }
   
   public void addPoints(int points){
     score += points; 
   }
   
   public int getScore(){
     return score; 
   }
  
   public int getLastScore(){
     return lastScore;
   }
   
   public int getHighScore(){
     return highScore;
   }
   
   public boolean getStatus() {
     return alive;
   }
   
   public void endGame() {
     alive = false;
   }
   
   public void startGame() {
     alive = true;
   }
}
