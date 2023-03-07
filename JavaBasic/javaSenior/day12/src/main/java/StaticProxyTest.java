import org.junit.Test;

interface ClothFactory{
    void produceCloth();
}

/**
 *代理类
 */
class ProxyClothFactory implements ClothFactory{
    private ClothFactory clothFactory;

    public ProxyClothFactory(ClothFactory clothFactory) {
        this.clothFactory = clothFactory;
    }

    @Override
    public void produceCloth() {
        System.out.println("Proxy factory do some prepare work.");
        clothFactory.produceCloth();
        System.out.println("Proxy factory do some work after done.");
    }
}
class NikeFactory implements ClothFactory{

    @Override
    public void produceCloth() {
        System.out.println("Nike factory doing some produce.");
    }
}
public class StaticProxyTest {
    public static void main(String[] args) {
        ClothFactory nike =new NikeFactory();
        ClothFactory proxyClothFactory = new ProxyClothFactory(nike);
        proxyClothFactory.produceCloth();
    }

}
