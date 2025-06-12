class ScoreManager{
 
   private int score;
   
   public ScoreManager(){
      score = 0; 
   }
   
   public void reset(){
     score = 0; 
   }
   
   public void addPoints(int points){
     score += points; 
   }
   
   public int getScore(){
     return score; 
   }
  
}
