using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class Bird : Aniaml
    {
        public Bird()
        {
        }
        public virtual void Fliying()
        {
            Console.WriteLine("鸟类具有飞行能力");
        }
    }
}
