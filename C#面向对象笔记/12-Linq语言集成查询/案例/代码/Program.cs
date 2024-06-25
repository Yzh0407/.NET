using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            BasicDemo();
            GroupDemo();
            MethodDemo();
            Console.ReadKey();
        }


        public static void BasicDemo()
        {
            //1.获取数据源
            List<int> list = new List<int> { 1, 2, 3, 4, 5, 6 };

            //2.创建LINQ查询语句
            //以from子句开头，以select或者是group by结束
            //from [范围变量] in [数据源] ;
            //范围变量：代表单个数据源元素，数据源中的每一个对象
            //select获取的目标元素
            var result = from n in list
                         where n>5
                         orderby n descending
                         select n;

            //3.执行查询语句
            foreach (var item in result)
            {
                Console.WriteLine(item);
            }
        }

        /// <summary>
        /// 分组
        /// </summary>
        public static void GroupDemo()
        {
            //创建数据源
            List<Student> list = new List<Student>()
            {
                new Student{ ClassId=1,Name="徐立阳"},
                new Student{ ClassId=1,Name="程胡语"},
                new Student{ ClassId=1,Name="黄开展"},
                new Student{ ClassId=2,Name="合理化"},
                new Student{ ClassId=2,Name="带带我"},
                new Student{ ClassId=3,Name="物是人非"}

            };

            //创建查询
            var result = from s in list
                         group s by new { s.ClassId };
                         

            foreach (var item in result)
            {
                Console.WriteLine(item.Key);
                foreach (var s in item)
                {
                    Console.WriteLine(" "+s.Name);
                }
            }

        }
        /// <summary>
        /// 查询方法使用
        /// </summary>
        public static void MethodDemo()
        {
            //创建数据源
            List<Student> list = new List<Student>()
            {
                new Student{ ClassId=1,Name="徐立阳"},
                new Student{ ClassId=1,Name="程胡语"},
                new Student{ ClassId=1,Name="黄开展"},
                new Student{ ClassId=2,Name="合理化"},
                new Student{ ClassId=2,Name="带带我"},
                new Student{ ClassId=3,Name="物是人非"}

            };

            var result = list.GroupBy(s => s.ClassId).Where(r => r.Count() > 2);
            

            foreach (var item in result)
            {
                Console.WriteLine(item.Key);
                foreach (var s in item)
                {
                    Console.WriteLine("姓名：" + s.Name);
                }
                
            }
        }
    }
}
