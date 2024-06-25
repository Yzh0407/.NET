using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class Aniaml
    {
        int leg;
        double weight;

        public int Leg { get => leg; set => leg = value; }
        public double Weight { get => weight; set => weight = value; }

        public virtual void Eat()
        {
            Console.WriteLine("Eat");
        }
        public virtual void Sound()
        {
            Console.WriteLine("Sound");

        }
        public virtual void Sleep()
        {

            Console.WriteLine("Sleep");
        }
    }
    
}
