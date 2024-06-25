
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo1
{
    class Program
    {
        static void Main(string[] args)
        {
            //BasicDemo();
            //查询学生信息
            GroupbyDemo();
            Console.ReadKey();
        }


        static void BasicDemo()
        {
            //1.获取数据源：定义数组作为数据源
            int[] num = { 8, 9, 7, 12, 23, 5 };

            //2.创建查询
            //select * from 表
            //linq语句语法：
            //1）必须以from子句开始
            //from [单个数据源元素] in [数据源]
            //2）以select或者group by 结束
            //3）在from子句和select子句中可以放where\orderby等子句

            IEnumerable<int> result = from n in num
                                      where n > 5
                                      orderby n descending
                                      select n;
                                      


            //3.执行查询
            foreach (var item in result)
            {
                Console.WriteLine(item);
            }
        }

        /// <summary>
        /// 分组查询
        /// </summary>
        static void GroupbyDemo()
        {
            //list存储学生信息，作为数据源
            List<Student> list = new List<Student>();

            list.Add(new Student { ClassId = 1,Name="许历阳",Sex="女",Age = 12});
            list.Add(new Student { ClassId = 1, Name = "许历阳2", Sex = "男", Age = 12 });
            list.Add(new Student { ClassId = 1, Name = "许历阳3", Sex = "女", Age = 12 });
            list.Add(new Student { ClassId = 2, Name = "许历阳4", Sex = "男", Age = 16 });
            list.Add(new Student { ClassId = 3, Name = "许历阳5", Sex = "女", Age = 12 });
            list.Add(new Student { ClassId = 2, Name = "许历阳6", Sex = "女", Age = 18 });
            list.Add(new Student { ClassId = 1, Name = "许历阳7", Sex = "女", Age = 12 });


            //创建查询语句
           IEnumerable<IGrouping<int,Student>> result = 
                                        (from s in list
                                        group s by s.ClassId into g
                                        where g.Key>1
                                        select g).ToList();
            //查询语句创建时通常不立即执行，用ToList方法使查询立即执行；测试有加和没加ToList方法，看结果

            list.Add(new Student { ClassId=4,Name="陈德"});
            


            //执行查询，遍历结果
            foreach (var item in result)
            {
                //分组的key
                Console.WriteLine(item.Key);

                //迭代输出每一组的所有对象
                foreach (var s in item)
                {
                    Console.WriteLine(s);
                }
                
            }


        }
    }
}
