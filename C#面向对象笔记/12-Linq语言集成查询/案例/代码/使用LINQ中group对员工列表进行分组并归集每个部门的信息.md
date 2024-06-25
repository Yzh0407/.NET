实例：使用LINQ中group对员工列表进行分组并归集每个部门的信息（如图一）。

要求：1、归集每个部门的详细信息。

          2、统计每个部门的员工数量、工资总额、平均工资。
    
          3、归集每个部门下的员工列表。



图一：结果图

static void Main(string[] args)
{
    //获取所以员工信息列表
    List<Emplayee> empList = GetAllEmplayeeList();

    //归集每个部门信息
    List<DeptInfo> deptList = (from emp in empList
                                where emp.Status == "在职"            //筛选“在职”员工     
                                orderby emp.DeptID ascending          //按“部门ID”排序
                                group emp by new                      //按“部门ID”和“部门名称”分组
                                {
                                    emp.DeptID,
                                    emp.DeptName
                                }
                                into g
                                select new DeptInfo()
                                {
                                    DeptID = g.Key.DeptID,
                                    DeptName = g.Key.DeptName,
                                    EmplayeeCount = g.Count(),          //统计部门员工数量
                                    WageSum = g.Sum(a => a.Wage),       //统计部门工资总额
                                    WageAvg = g.Average(a => a.Wage),   //统计部门平均工资
                                    EmplayeeList = (from e in g         //归集部门员工列表
                                                    select new Emplayee()
                                                    {
                                                        EmpID = e.EmpID,
                                                        EmpName = e.EmpName
                                                    }
                                                    ).ToList()
     
                                }).ToList();
     
    //打印结果
    foreach (DeptInfo dept in deptList)
    {
        string msg = String.Format("{0}【员工总数：{1}，工资总额：{2}，平均工资：{3}，员工列表：{4}】",
            dept.DeptName, dept.EmplayeeCount, dept.WageSum, dept.WageAvg, String.Join("、", dept.EmplayeeList.Select(a => a.EmpName)));
        Console.WriteLine(msg);
    }
     
    Console.Read();
}

/// <summary>
/// 获取所以员工信息列表
/// </summary>
public static List<Emplayee> GetAllEmplayeeList()
{
    List<Emplayee> empList = new List<Emplayee>();
    empList.Add(new Emplayee() { EmpID = 1, EmpName = "张伟伟", Status = "在职", Wage = 500, DeptID = 1, DeptName = "研发部" });
    empList.Add(new Emplayee() { EmpID = 2, EmpName = "李涛涛", Status = "在职", Wage = 800, DeptID = 1, DeptName = "研发部" });
    empList.Add(new Emplayee() { EmpID = 3, EmpName = "王亮亮", Status = "离职", Wage = 600, DeptID = 1, DeptName = "研发部" });
    empList.Add(new Emplayee() { EmpID = 4, EmpName = "孙红红", Status = "在职", Wage = 400, DeptID = 2, DeptName = "财务部" });
    empList.Add(new Emplayee() { EmpID = 5, EmpName = "黄苗苗", Status = "在职", Wage = 300, DeptID = 2, DeptName = "财务部" });
    empList.Add(new Emplayee() { EmpID = 6, EmpName = "蔡明明", Status = "在职", Wage = 900, DeptID = 3, DeptName = "公共市场部" });
    empList.Add(new Emplayee() { EmpID = 7, EmpName = "吴慧慧", Status = "离职", Wage = 200, DeptID = 3, DeptName = "公共市场部" });
    return empList;
}
其它代码：

创建员工信息类（Emplayee.cs）

/// <summary>  
/// 员工信息类  
/// </summary>  
public class Emplayee
{
    /// <summary>
    /// 员工ID
    /// </summary>
    public int EmpID { get; set; }

    /// <summary>
    /// 员工名称
    /// </summary>
    public string EmpName { get; set; }
     
    /// <summary>
    /// 状态（在职，离职）
    /// </summary>
    public string Status { get; set; }
     
    /// <summary>
    /// 工资
    /// </summary>
    public decimal Wage { get; set; }
     
    /// <summary>
    /// 部门ID
    /// </summary>
    public int DeptID { get; set; }
     
    /// <summary>
    /// 部门ID
    /// </summary>
    public string DeptName { get; set; }
}  
创建部门信息类（DeptInfo.cs）

/// <summary>
/// 部门信息类
/// </summary>
public class DeptInfo
{
    /// <summary>
    /// 部门ID
    /// </summary>
    public int DeptID { get; set; }

    /// <summary>
    /// 部门ID
    /// </summary>
    public string DeptName { get; set; }
     
    /// <summary>
    /// 员工数量
    /// </summary>
    public int EmplayeeCount { get; set; }
     
    /// <summary>
    /// 工资总额
    /// </summary>
    public decimal WageSum { get; set; }
     
    /// <summary>
    /// 平均工资
    /// </summary>
    public decimal WageAvg { get; set; }
     
    /// <summary>
    /// 员工列表
    /// </summary>
    public List<Emplayee> EmplayeeList { get; set; }
}

