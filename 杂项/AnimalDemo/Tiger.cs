using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class Tiger:CatFamily
    {
        public override void Eat()
        {
            Console.WriteLine("老虎会吃饭");    
        }
        public override void Sound()
        {
            Console.WriteLine("嗷呜,.....吼........");

        }



    }
}
