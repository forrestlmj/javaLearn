public class Goods implements Comparable {
    private String name;

    public String getName() {
        return name;
    }

    public Goods() {
    }

    @Override
    public String toString() {
        return "Goods{" +
                "name='" + name + '\'' +
                ", price=" + price +
                '}';
    }

    public Goods(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    private double price;

    @Override
    public int compareTo(Object o) {
        if(o instanceof Goods){
            Goods g = (Goods) o;
            if(this.price > g.price) return 1;
            else  return -1;

        }
        throw new RuntimeException("不是Goods类型");
    }
}
