using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lesson23
{
    internal class Student
    {
        public Student()
        {
        }

        public Student(int id, string name)
        {
            Id = id;
            Name = name;
        }

        public int Id { get; set; }
        public string Name { get; set; }


        public override string ToString()
        {
            return $"学号：{Id},姓名：{Name}";
        }


        public override bool Equals(object? obj)
        {
            //判断两个对象(this,obj)的属性值（Id,Name）是否都相同
            //this代表当前类的对象，哪个对象（s1）调用这个方法，this就指向这个对象（s1）
            
            //this.Id == obj.Id  this.Name == obj.Name  同时成立为true，否则   false
            //由于obj是object类型没有Id和Name属性，将obj转换为Student对象
            if(obj == null)
            {
                return false;
            }
          

            //将obj转换为Student
            Student student = obj as Student;
            if (student == null)
            {
                return false;   
            }

            //this.Id == student.Id  this.Name == student.Name  同时成立为true，否则   false
            if (this.Id == student.Id && this.Name == student.Name)
            {
                return true;
            }
            else
            {
                return false;
            }
           
            

               
            
          


        }

    }
}
