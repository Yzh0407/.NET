using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class Eagle:Bird
    {
        public override void Fliying()
        {
            Console.WriteLine("老鹰会自由飞翔");

        }
        public override void Eat()
        {
            Console.WriteLine("老鹰吃小鸡");
        }
        public override void Sound()
        {
            Console.WriteLine("老鹰咕咕叫");
        }
    }
}
