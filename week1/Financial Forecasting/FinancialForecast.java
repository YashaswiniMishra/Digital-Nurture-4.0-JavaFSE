//package FinancialForecasting;
public class FinancialForecast {

    // setup
    public static double futureValue(double p, double r, int y) {
        if (y == 0)
            return p;
        return futureValue(p, r, y - 1) * (1 + r);
    }
    //optimised
    public static double futureValueIterative(double p, double r, int y) {
    for (int i = 0; i < y; i++) 
        p *= 1 + r;
    return p;
    }

    public static void main(String[] args) {
        double pv = 1000, gr = 0.10; 
        int y = 5;
        System.out.println("Future Value after "+y+" years: "+ futureValue(pv, gr, y));
        System.out.println("Future Value after "+y+" years: "+ futureValueIterative(pv, gr, y));
    }
}
