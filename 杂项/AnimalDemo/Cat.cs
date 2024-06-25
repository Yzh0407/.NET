using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class CatFamily : Aniaml
    {
        int beard;

        public int Beard { get => beard; set => beard = value; }
        public virtual void Nightvision()
        {
            Console.WriteLine("猫科动物具有共同的夜视能力");
        }
    }
}
