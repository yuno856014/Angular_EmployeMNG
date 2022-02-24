using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeMNG.API.Models
{
    public partial class Employee
    {
        public int Id { get; set; }
        public string EmpLastName { get; set; }
        public string EmpName { get; set; }
        public string Position { get; set; }
        public string Avatar { get; set; }
        public string Title { get; set; }
        public int DepartmentId { get; set; }

        public virtual Department Department { get; set; }
    }
}
