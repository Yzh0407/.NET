# LINQ-语言集成查询

**课程目标**

掌握LINQ查询表达式的使用

## 什么是LINQ

LINQ是Language Integrate Query的缩写，语言集成查询，它实现了用相同的语法对不同的数据源类型进行查询的功能。

LINQ 本身的基础建设实现与System.Linq 命名空间内，使用时，必须引入该命名空间。

### LINQ 类型

- LINQ to Objects（或称LINQ to Collection），这是LINQ 的最基本功能，针对集合对象进行查询处理，包括基本的汇总与过滤都在这个功能内实现。
- LINQ to SQL，这是LINQ 功能的SQL Server 数据库版本，通过LINQ 指令，可以直接查询SQL Server 数据库，而完全无须编写SQL 指令。
- LINQ to XML，是针对XML 设计的LINQ 功能，它通过XDocument 与XElement 两个主要类的功能，进行LINQ 语法解析与XML 内的元素的查询操作。可用来替代现有以XPath方式解析XML文件的功能。
- LINQ to DataSet（或称LINQ to ADO.NET），是为现有以DataSet或DataTable 对象开发应用程序提供支持LINQ操作的功能，以AsEnumerate() 为基础，将DataSet与DataTable内的数据转换成IEnumerable接口的操作集合，即可直接使用LINQ to Objects 的方式查询。

## 查询操作的三个部分

所有 LINQ 查询操作都由以下三个不同的操作组成：

1. 获取数据源。
2. 创建查询。
3. 执行查询。

下面的示例演示如何用源代码表示查询操作的三个部分。 为方便起见，此示例将一个整数数组用作数据源；但其中涉及的概念同样适用于其他数据源。 

```c#
// 获取数据源
int[] scores = { 97, 92, 81, 60 };

// 创建查询表达式
IEnumerable<int> scoreQuery =
    from score in scores
    where score > 80
    select score;

// 在 foreach语句中执行查询
foreach (int i in scoreQuery)
{
    Console.Write(i + " ");
}

```

## LINQ查询表达式

**数据源必须实现了IEnumerable<T>接口才可以使用LINQ查询。**

所有的LINQ表达式都必须以from字句开始，以select、group by语句结束，在开头和结束的子句中间，可以使用where、orderby、join或者其他from子句。

LINQ查询表达式开头的**from子句用于指定数据源**，语法格式如下:

```c#
from [单个数据源元素] in [数据源]
```

LINQ查询表达式结束的**select子句用于指定返回的目标数据**，语法格式如下:

```c#
select  [目标元素]
```

LINQ to Object 查询最终返回的数据类型是IEnumerable<T>类型的，T的数据类型根据结束子句“select[目标元素]”的目标元素数据类型决定。由于返回类型实现了IEnumerable<T>接口，所以返回的数据还可以被作为数据源进行LINQ查询。

where子句根据指定条件对数据源进行过滤，语法格式如下：

```c#
where [过滤条件]
```

group by 子句将数据源进行分组，语法格式如下：

```C#
group  [单个数据源元素] by [分组字段] into [分组后新的数据源]
```

orderby 子句将返回的元素进行排序，语法格式如下：

```C#
orderby [排序对象]  descending(降序)|ascending(升序)
```





## LINQ查询方法

LINQ表达式实际上是调用了定义在System.Linq命名空间下对应的扩展方法，我们也可以直接使用扩展方法进行查询，这些扩展方法称为LINQ查询方法。

使用LINQ方法演示查询

```c#
// 创建数据源
int[] scores = { 97, 92, 81, 60 };

// 创建查询表达式
IEnumerable<int> scoreQuery = scores.Where(i => i > 0).OrderBy(i => i);

// 在 foreach语句中执行查询
foreach (int i in scoreQuery)
{
    Console.Write(i + " ");
}
```

LINQ查询方法中要求我们传入的是委托，结合Lambda表达式，我们只需要按照方法参数中的委托定义传入对应的lambda表达式即可。



## LINQ查询的延迟加载

在上面案例创建查询语句的时候，并没有真的对数据源进行查询，查询实际发生在迭代数据项时。

我们通过例子来理解该延迟加载问题。

```c#
		List<int> list = new List<int> { 1, 3, 12, 34, 98, 23 };
        var result = list.Where(i => i > 10).OrderBy(i => i);
        Console.WriteLine("第一次遍历：");
        foreach (var item in result)
        {
            Console.WriteLine(item);
         }

        //往数据源list中添加元素
        list.Add(100);
        list.Add(200);

       Console.WriteLine("第二次遍历：");        
       foreach (var item in result)
        {
            Console.WriteLine(item);
        }
```

两次遍历同一个查询结果变量，第二次遍历输出结果包含新增元素。说明是在迭代输出的时候执行查询语句。

利用LINQ查询延迟加载的特性，可以检测出数据源的变化。

用ToArray()、ToList()方法可以强制执行查询语句，会直接返回结果，将结果保存到内存中。



```c#
	List<int> list = new List<int> { 1, 3, 12, 34, 98, 23 };
    var result = list.Where(i => i > 10).OrderBy(i => i).ToList();
    Console.WriteLine("第一次遍历：");
    foreach (var item in result)
    {
        Console.WriteLine(item);
     }

    //往数据源list中添加元素
    list.Add(100);
    list.Add(200);

   Console.WriteLine("第二次遍历：");        
   foreach (var item in result)
    {
        Console.WriteLine(item);
    }
```
在查询语句后添加ToList()方法后，第二次遍历结果不受list添加元素的影响。因为添加后丧失了延迟性，直接执行查询将结果保存到对象中成为新的数据源。

## LINQ标准查询操作符

| 类型       | 操作符名称                                                   |
| ---------- | ------------------------------------------------------------ |
| 投影操作符 | Select,SelectMany                                            |
| 限制操作符 | Where                                                        |
| 排序操作符 | OrderBy,OrderByDescending,ThenBy,ThenByDescending,Reverse    |
| 联接操作符 | Join,GroupJoin                                               |
| 分组操作符 | GroupBy                                                      |
| 串联操作符 | Concat                                                       |
| 聚合操作符 | Average,Count,Max,Min,Sum                                    |
| 集合操作符 | Distinct,Union,Intersect,Except                              |
| 生成操作符 | Empty,Range,Repeat                                           |
| 转换操作符 | AsEnumerable,Cast,OfType,ToArray,ToDictionary,ToList,ToLookup |
| 元素操作符 | DefaultIfEmpty,ElementAt,ElementAtOrDefault,First,Last,FirstOrDefault, LastOrDefault,Single,SingleOrDefault |
| 相等操作符 | SequenceEqual                                                |
| 量词操作符 | All,Any,Contains                                             |
| 分割操作符 | Skip,SkipWhile,Take,TakeWhile                                |

## 总结

1. LINQ是一种语言集成查询，用相同的语法实现对不同数据源的访问。
2. 需要引入命名空间System.Linq等
3. LINQ 查询三步骤：获取数据源-》创建查询-》执行查询；
4. LINQ查询可以是表达式也可以是方法，最终是执行方法。
5. LINQ查询在迭代使用时才执行，具有延迟性。可以使用ToArray()或ToList()等方法强制执行，即会丧失延迟性。