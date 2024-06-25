using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace ConsoleApp14
{
    class Program
    {
        static void Main(string[] args)
        {
            //定义字典集合存放学生信息
            Dictionary<string, Student> studentInfo = new Dictionary<string, Student>();

            while (true) {
                Console.WriteLine();
                Console.WriteLine("==========================================");
                Console.WriteLine("============1.添加学生信息================");
                Console.WriteLine("============2.删除学生信息================");
                Console.WriteLine("============3.修改学生信息================");
                Console.WriteLine("============4.查询学生信息================");
                Console.WriteLine("============5.退出        ================");
                Console.WriteLine("==========================================");
                Console.Write("\n请输入你选择的功能序号：");
                string select = Console.ReadLine();

                switch (select)
                {
                    case "1":
                        //添加学生信息
                        AddStudent(studentInfo);
                        Console.WriteLine("=======操作后的学生信息==========");
                        //输出所有学生信息
                        PrintInfo(studentInfo);
                        break;
                    case "2":
                        //删除学生信息
                        ReMoveStudent(studentInfo);
                        Console.WriteLine("=======操作后的学生信息==========");
                        //输出所有学生信息
                        PrintInfo(studentInfo);
                        break;
                    case "3":
                        //修改学生信息
                        UpdateStudent(studentInfo);
                        Console.WriteLine("=======操作后的学生信息==========");
                        //输出所有学生信息
                        PrintInfo(studentInfo);
                        break;
                    case "4":
                        //查询学生信息
                        QueryInfo(studentInfo);
                        break;
                    case "5":
                        //退出
                        System.Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine("输入错误，重新输入!\n");
                        break;
                }

                


            

            }

            Console.ReadKey();






           

        }

        private static void QueryInfo(Dictionary<string, Student> studentInfo)
        {
            bool flag = true;
            while (flag)
            {
                Console.WriteLine();
                Console.WriteLine("==========================================");
                Console.WriteLine("===1.查询所有学生信息（按学号排序）=======");
                Console.WriteLine("===2.查询所有学生信息（按姓名排序）=======");
                Console.WriteLine("===3.查询所有学生信息（按年龄排序）=======");
                Console.WriteLine("===4.按学号查询                    =======");
                Console.WriteLine("===5.退出                          =======");
                Console.WriteLine("==========================================");
                Console.Write("\n请输入你选择的功能序号：");
                string select = Console.ReadLine();

                switch (select)
                {
                    case "1":
                        //查询所有学生信息（按学号排序）
                        Console.WriteLine("\n=========按学号排序的学生信息=========");
                        Sort(studentInfo, new ComparerByNum());
                        break;
                    case "2":
                        //查询所有学生信息（按姓名排序)
                        Console.WriteLine("\n=========按姓名排序的学生信息=========");
                        Sort(studentInfo, new ComparerByName());
                        break;
                    case "3":
                        //查询所有学生信息（按年龄排序)
                        Console.WriteLine("\n=========按年龄排序的学生信息=========");
                        Sort(studentInfo, new ComparerByAge());
                        break;
                    case "4":
                        //按学号查询学生信息
                        QueryByNum(studentInfo);
                        break;
                    case "5":
                        //退出
                        flag = false;
                        break;
                    default:
                        Console.WriteLine("输入错误，重新输入!\n");
                        break;
                }
            }
            
        }
        /// <summary>
        /// 根据学号查询学生信息
        /// </summary>
        /// <param name="studentInfo"></param>
        private static void QueryByNum(Dictionary<string, Student> studentInfo)
        {
            Console.Write("\n请输入要查询的学号：");
            string num = Console.ReadLine();
            if (studentInfo.ContainsKey(num))
            {
                Console.WriteLine($"\n学号{num}的学生信息：");
                Console.WriteLine(studentInfo[num]);
            }
            else
            {
                Console.WriteLine("查无此人!\n");
            }
        }

        /// <summary>
        /// 根据学号修改学生的信息
        /// </summary>
        /// <param name="studentInfo"></param>
        private static void UpdateStudent(Dictionary<string, Student> studentInfo)
        {
            Console.WriteLine("\n请输入要修改的学生信息的学号:");
            string num = Console.ReadLine();

            //根据学号判断学生信息是否存在
            if (studentInfo.ContainsKey(num))
            {
                //修改
                Console.Write("请输入修改后的姓名：");
                studentInfo[num].Name = Console.ReadLine();

                Console.Write("请输入修改后的年龄：");
                studentInfo[num].Age = int.Parse(Console.ReadLine());

                Console.WriteLine($"\n学号为{num}的学生信息修改成功!\n");


            }
            else
            {
                Console.WriteLine($"没有学号为{num}的学生，修改失败!");
            }
        }

        /// <summary>
        /// 删除学生信息
        /// </summary>
        /// <param name="studentInfo">学生信息集合</param>
        private static void ReMoveStudent(Dictionary<string, Student> studentInfo)
        {
            Console.Write("\n请输入要删除的学生信息的学号:");
            string num = Console.ReadLine();

            //根据学号判断学生信息是否存在
            if (studentInfo.ContainsKey(num))
            {
                //删除
                studentInfo.Remove(num);

                Console.WriteLine($"成功删除学号为{num}的学生信息\n");
            }
            else
            {
                Console.WriteLine($"没有学号为{num}的学生，删除失败!\n");
            }

        }

        /// <summary>
        /// 输出所有学生信息
        /// </summary>
        /// <param name="studentInfo">学生信息集合</param>
        public static void PrintInfo(Dictionary<string,Student> studentInfo)
        {
            foreach (var item in studentInfo.Values)
            {
                Console.WriteLine(item);

            }
        }



        /// <summary>
        /// 添加学生信息
        /// </summary>
        /// <param name="studentInfo">学生信息集合</param>
        public static void AddStudent(Dictionary<string, Student> studentInfo)
        {
            try
            {
                Student stu = new Student();
                
                Console.WriteLine("\n请输入新增学生的信息：\n");
                Console.Write("学号：");
                stu.Num = Console.ReadLine();

                Console.Write("姓名：");
                stu.Name = Console.ReadLine();

                Console.Write("年龄：");

                stu.Age = int.Parse(Console.ReadLine());

                //判断学号是否重复
                if (studentInfo.ContainsKey(stu.Num))
                {
                    //重复，不添加
                    Console.WriteLine("学号已存在，添加失败!\n");
                }
                else
                {
                    //不重复，将学生信息添加到信息集合中
                    studentInfo.Add(stu.Num, stu);
                    Console.WriteLine("添加成功!\n");
                }
            }
            catch (Exception e)
            {

                Console.WriteLine("添加异常，请重新操作!\n异常信息：{0}\n",e.Message);
            }
            

        }


        //排序
        public static void Sort(Dictionary<string,Student> studentInfo,IComparer<Student> comparer)
        {
            List<Student> list = new List<Student>();
            list.AddRange(studentInfo.Values);

            list.Sort(comparer);
            foreach (Student item in list)
            {
                Console.WriteLine(item);
            }
        
        
        }
    }
}
