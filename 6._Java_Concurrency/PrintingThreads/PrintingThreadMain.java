package PrintingThreads;

public class PrintingThreadMain {
    // todo Make printingThead take a string ("sentence") and print out each char of that sentence
    public static void main(String[] args) {
        PrintingThread printingThreadOne = new PrintingThread("HI KEVIN");
        PrintingThread printingThreadTwo = new PrintingThread("HI WINSTON");
        PrintingThread printingThreadThree = new PrintingThread("HI WILLIAMS");

        printingThreadOne.start();
        printingThreadTwo.start();
        printingThreadThree.start();
    }
}
