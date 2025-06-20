class BinarySearch {
    public static Product search(Product[] p, String n) {
        for (int i = 0; i < p.length - 1; i++) {
            for (int j = 0; j < p.length - i - 1; j++) {
                if (p[j].productName.compareToIgnoreCase(p[j + 1].productName) > 0) {
                    Product t = p[j];
                    p[j] = p[j + 1];
                    p[j + 1] = t;
                }
            }
        }

        int l = 0, r = p.length - 1;
        while (l <= r) {
            int m = (l + r) / 2;
            int c = n.compareToIgnoreCase(p[m].productName);
            if (c == 0) 
            return p[m];
            else if (c < 0)
             r = m - 1;
            else 
            l = m + 1;
        }
        return null;
    }
}