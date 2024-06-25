namespace Animal
{
    internal class Program
    {
        //Main:主方法是一个static静态方法，静态方法不能直接调用非静态成员
        static void Main(string[] args)
        {

            //1.子类对象可以直接赋值给父类变量
            Aniaml aniamlCat = new Cat();

            //2.子类对象可以调用父类的成员，
            aniamlCat.Sleep();
            //但是父类对象永远只能调用自己的成员；父类对象不能调用子类成员
            //aniamlCat.NightVision();错误代码，父类对象不能直接调用子类成员


            //3.如果父类对象中装的是子类对象，可以将父类对象强制转换为子类对象；
            //强转：数据类型 变量 =   (数据类型)  待转换的数据;
            //aniamlCat是父类对象Cat实例，可以成功转换为Cat对象
            Cat cat1 = (Cat)aniamlCat;

            cat1.Nightvision();
            //aniamlCat是父类对象Cat实例，不可以转换为Tiger

            //Tiger tiger = (Tiger)aniamlCat;程序运行会抛异常
            //tiger.Nightvision();

            //避免异常，转换前应该要先判断父类对象是否为目标类型；是再进行转换，不是就不进行转换


            //同一个Sound方法可以接受不同的子类对象（因为其形参为父类类型）
            Sound(new Cat());
            Sound(new Tiger());   
            Sound(new Swallow());  
            Sound(new Eagle());  

        }


        //方法，调用动物叫声，模拟出不同动物的叫声;传递一个动物
        //Aniaml:父类，定义父类为形参可以接受任意子类对象；
        public static void Sound(Aniaml aniaml)
        {
            //animal存储不同子类对象，调用不同的Sound方法，执行不同的代码，得到不同的结果，是一种多态
            aniaml.Sound();

        }



        //方法代表夜视能力
        public static void NightVision(Aniaml aniaml)
        {
            if (aniaml == null)
            {
                return;
            }
            //判断animal是否为猫科类
            //对象 is 目标数据类型 :对象是目标数据类型或者其子类返回true,否则不是返回false
            if(aniaml is CatFamily)
            {
                //animal先判断是否为猫科类，是再强制转换为猫科对象
                CatFamily catFamily  = aniaml as CatFamily;
                //猫科对象才能调用夜视能力，Animal对象不能调用子类
                if (catFamily != null)
                {
                    catFamily.Nightvision();

                }
            }
 

        }


        //方法代表夜视能力
        public static void NightVision1(Aniaml aniaml)
        {
            //判断animal是否为猫科类
            //对象 as 目标数据类型 :对象是目标数据类型或者其子类返回目标类型的对象,否则不是返回null
           CatFamily catFamily = aniaml as CatFamily;   
            if(catFamily != null) { 
                catFamily.Nightvision();    
            
            }


        }





    }
}