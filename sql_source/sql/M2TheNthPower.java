public class M2TheNthPower {
    public static int power(int m, int n) {
        int product = m;
        int i;
        
        for (i = 1; i < n; i++) {
            product *= m;
        }
        return product;
    }
    
    public static void main(String[] args) {
        int firstArg = Integer.parseInt(args[0]);
        int secondArg = Integer.parseInt(args[1]);
        int result = power(firstArg, secondArg);
        System.out.println(firstArg + " raised to the power of " + secondArg + " is " + result);
    }
}