using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class Cat:CatFamily
    {
        public override void Eat()
        {
            Console.WriteLine("猫会吃鱼");
        }
        public override void Sound()
        {
            Console.WriteLine("猫会喵喵叫");
        }
    }
}
