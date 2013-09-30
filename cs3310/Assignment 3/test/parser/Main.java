public class Main {
   public static void main(String [] args) {
      try {
         new MiniIRParser(System.in).Goal();
         System.out.println("Program parsed successfully");
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
}
