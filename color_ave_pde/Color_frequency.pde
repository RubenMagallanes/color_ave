public class color_freq_pair{
      private color col; // remeber color is wrapper for 32 bit int
      private int freq;
      
      public color_freq_pair(color c){
            col = c;
            freq = 0; 
      }
      
      public void increment_frequency(){
            freq++;
      }
      public int frequency(){
            return freq;
      }
      public color get_color(){
            return this.col;
      }
      public boolean color_equals (color_freq_pair other){
            if (other.get_color() == (this.col)) return true;
            return false;
      }
      public color_freq_pair larger(color_freq_pair other){
            if (other.frequency() > this.freq)
                  return other;
            return this;
      }
}