using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class Swallow:Bird
    {
        public override void Fliying()
        {
            Console.WriteLine("鸟会扇动翅膀");
        }
        public override void Sound()
        {
            Console.WriteLine("叽叽喳喳叫");
        }

        public override void Eat()
        {
            Console.WriteLine("燕子吃虫子，........");
        }
    }
}
