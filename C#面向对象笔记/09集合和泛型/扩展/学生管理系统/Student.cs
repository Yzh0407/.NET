using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp14
{
    class Student
    {
        string num;
        string name;
        int age;

        public string Num { get => num; set => num = value; }
        public string Name { get => name; set => name = value; }
        public int Age { get => age; set => age = value; }

        public Student()
        {

        }
        public Student(string num,string name,int age)
        {
            this.num = num;
            this.name = name;
            this.age = age;

        }

        public override string ToString()
        {
            return $"学号：{Num},姓名：{Name},年龄:{Age}";

        }


    }
}
