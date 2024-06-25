using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo1
{
    class Student
    {
        public int ClassId { get; set; }
        public string Name { get; set; }
        public string Sex { get; set; }
        public int Age { get; set; }

        public override string ToString()
        {
            return $"班级: {ClassId} ,姓名:{Name},性别:{Sex},年龄:{Age}";
        }

    }
}
