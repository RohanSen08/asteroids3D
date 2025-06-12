import processing.sound.SoundFile;

class Sound {
  private SoundFile laser;
  private SoundFile explosion;
  
  public Sound(Asteroids3D game) {
    laser = new SoundFile(game, "laser.mp3");
    explosion = new SoundFile(game, "explosion.mp3");
  }
  
  public void playLaser() {
    laser.play();
  }
  
  public void playExplosion() {
    explosion.play();
  }
}
