namespace Lesson23
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Student s1 = new Student(1,"张三"); 
            Student s2 = new Student(1,"张三");
            Console.WriteLine(s1);
            Console.WriteLine(s2);
            if (s1.Equals(null))
            {
                Console.WriteLine("s1和s2是相等，代表同一个学生");
            }
            else { 
                Console.WriteLine("s1和s2是不相等，代表不是同一个学生");

            }
        }
    }
}