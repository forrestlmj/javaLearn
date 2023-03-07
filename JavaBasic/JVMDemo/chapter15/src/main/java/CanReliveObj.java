public class CanReliveObj {
    public static CanReliveObj obj;

    /**
     * 此方法只调用一次。
     * @throws Throwable
     */
    @Override
    protected void finalize() throws Throwable {
        super.finalize();
        System.out.println("调用当前类重写的finalize()方法");
        // 当前等待回收的对象在 finalize() 方法中与引用链上的一个对象obj建立了联系。
        obj = this;

    }

    public static void main(String[] args) {
        try {
            CanReliveObj obj = new CanReliveObj();
            // 对象第一次成功拯救自己
            obj = null;
            //调用垃圾回收器
            System.gc();
            System.out.println("第1次 gc");
            // 因为Finalizer线程优先级很低，暂停2秒，以等待它
            Thread.sleep(2000);

            if (obj==null) {
                System.out.println("obj is dead");
            }else {
                System.out.println("obj is still alive");
            }

            System.out.println("第2次 gc");
            // 下面这段代码与上面的完全相同，但是这次自救却失败了
            obj = null;
            System.gc();
            // 因为Finalizer线程优先级很低，暂停2秒，以等待它
            Thread.sleep(2000);
            if (obj == null) {
                System.out.println("obj is dead");
            } else {
                System.out.println("obj is still alive");
            }
        }catch (Exception e){
            e.printStackTrace();

        }
    }
}
