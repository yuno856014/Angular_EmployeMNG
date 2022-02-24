using EmployeeMNG.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeMNG.Service.Departments
{
    public interface IDepartmentService
    {
        IQueryable<Department> GetAll();
    }
}
