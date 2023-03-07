public class SeasonTest {
    public static void main(String[] args) {
        System.out.println(Season.SPRING);
        System.out.println(Season.SUMMER.toString());
    }
}
enum Season{
    SPRING("春天"),
    SUMMER("夏天"),
    AUTUMN("秋天"),
    WINTER("冬天");
    private Season(String seasonName){
        this.seasonName = seasonName;
    }
    private final String seasonName;


}
