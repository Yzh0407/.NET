using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp14
{
    class ComparerByAge : IComparer<Student>
    {
        public int Compare(Student x, Student y)
        {
            return x.Age - y.Age;
        }
    }
}
