using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp14
{
    class ComparerByNum : IComparer<Student>
    {
        public int Compare(Student x, Student y)
        {
            return x.Num.CompareTo(y.Num);
        }
    }
}
