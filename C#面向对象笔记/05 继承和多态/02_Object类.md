## 本节目标

1. Equals方法：判断两个对象是否相等
2. GetHashCode方法：获取哈希码
3. GetType方法：获取对象type类型
4. **ToString**方法：返回对象实例的字符串

## Object类

在 C# 语言中所有类都是从 Object 类继承而来的，Object 类中的属性和方法可以被用到任何类。

**Object 类是 C# 语言中最原始、最重要的类，是所有类的“祖先”**，每个 C# 类都是它的子类，它实现了每个类都必须具有的基本方法。

这里指的“所有类”，即不管是 C# 系统所提供的标准类，还是用户自行編写的类，都是从Object类直接或间接继承而来，它是类层次结构中的顶级类，即 C# 树型类层次结构的“根”。

**Object 类中的属性和方法可以被用到任何类。**

当編程者定义一个类时没有继承任何类，则編译器认为该类从 Object 类继承而来。

但 Object 类的方法所实现的功能很有限，都是由编程者在自行设计的 class 类型的类体内编写与原型完全相同的方法来覆盖它们，以实现用户所要求的有用功能。

**在 Object 类中提供了 4 个常用的方法，即 Equals、GetHashCode、GetType 以及 ToString 方法。**

我们将在接下来的几节中分别为大家讲解这四种常用方法。

既然任何一个类都继承了 Object 类，这 4 个方法也可以被任何类使用或重写。


### Equals方法：判断两个对象是否相等

**C# Equals 方法主要用于比较两个对象是否相等，如果相等则返回 True,否则返回 False。**

如果是引用类型的对象，则用于判断两个对象是否引用了同一个对象。

在 C# 语言中，Equals 方法提供了两个，一个是静态的，一个是非静态的，具体的定义如下。

```C#
	Equals (object ol, object o2); //静态方法
	Equals (object o2); //非静态方法
```

下面通过实例演示 Equals 方法的使用。

【实例】使用 Equals 方法判断两个对象是否引用了 Student 对象。

根据题目要求，首先创建 Student 类，由于并不需要使用该类的成员，在类中不必写 任何代码，创建 Student 类的代码如下。

```C#
	class Student{};
```

创建两个 Student 类的对象，并使用 Equals 方法比较类的对象，代码如下。

创建两个 Student 类的对象，并使用 Equals 方法比较类的对象，代码如下。

```C#
	class Program
	{
		static void Main(string[] args)
		{
			Student stu1 = new Student();
			Student stu2 = new Student();
			bool flag = Equals(stu1, stu2);
			Console.WriteLine("stu1 和 stu2 比较的结果为，{0}", flag);
		}
	}
```

执行上面的代码，查看效果。

从上面的执行效果可以看出，Stu1 和 Stu2 引用的并不是同一个对象。如果将代码更改为：

```C#
Student stu2=stu1;
```

这样使用 Equals 方法判断的结果才为 True。如果使用 Equals(object o)方法比较 stul 和 stu2 的值，代码如下。

```C#
stul.Equals(stu2);
```



### GetHashCode方法：获取哈希码

C# GetHashCode 方法返回当前 System.Object 的哈希代码，每个对象的哈希值都是固定的。

该方法不含有任何参数，并且不是静态方法，因此需要使用实例来调用该方法。

由于该方法是在 Object 类中定义的，因此任何对象都可以直接调用该方法。

下面通过实例来演示该方法的使用。

【实例】创建两个 Student 类的对象，并分别计算其哈希值。

根据题目要求，代码如下。

```C#
	class Program
	{
		static void Main(string[] args)
		{
			Student stu1 = new Student();
			Student stu2 = new Student();
			Console.WriteLine(stu1.GetHashCode());
			Console.WriteLine(stu2.GetHashCode());
		}
	}
```

执行上面的代码，查看效果。

从上面的执行效果可以看出，不同实例的哈希值是不同的，因此也可以通过该方法比较对象是否相等。

### GetType方法：获取对象type类型

C# GetType 方法用于获取当前实例的类型，返回值为 System.Type 类型。

C# GetType 方法不含任何参数，是非静态方法。

其调用与上一节《C# GetHashCode方法》介绍的 GetHashCode() 方法类似，使用任何对象都能直接调用该方法。

下面通过实例来演示该方法的使用。

【实例】创建字符串类型的变量、整数类型的变量以及 Student 类的对象，并分别使用 GetType 方法获取其类型并输出。

根据题目要求，代码如下。

```C#
	class Program
	{
		static void Main(string[] args)
		{
			int i = 100;
			string str = "abc";
			Student stu = new Student();
			Console.WriteLine(i.GetType());
			Console.WriteLine(str.GetType());
			Console.WriteLine(stu.GetType());
		}
	}
```

执行上面的代码，查看效果。

从上面的执行效果可以看出，每一个变量都通过 GetType 方法获取了其类型，通常可以使用该方法比较某些对象是否为同一类型的。


### ToString方法：返回对象实例的字符串

**C# ToString 方法返回一个对象实例的字符串，在默认情况下将返回类类型的限定名**。

C# 中几乎所有的类型都派生自 Object，所以如果当前类型没有重写 ToString() 方法的情况下，调用 ToString() 方法，默认返回当前类型的名称。

任何类都可以**用override重写 ToString 方法**，返回自定义的字符串。

对于其他的值类型，则为将值转换为字符串类型的值。

【实例】创建整数类型的变量以及 Object 类的对象，并分别使用 ToString 方法获取其字符串的表现形式并输出。

根据题目要求，代码如下。



```C#
	class Program
	{
		static void Main(string[] args)
		{
			Int32 a = 1;
			Object b = new Object();
			Console.WriteLine("值类型(Int32类型)的字符串的表现形式:{0}", a.ToString());
			Console.WriteLine("引用类型字符串的表现形式:{0}", b.ToString());
		}
	}
```

执行上面的代码，查看效果。

### 小结

1. 在 C# 语言中所有类都简接或直接继承了 Object 类；所以所有类都拥有Object类中的方法；
2. **Equals方法：判断两个对象是否相等**
3. GetHashCode方法：获取哈希码
4. GetType方法：获取对象type类型
5. **ToString方法：返回对象实例的字符串**