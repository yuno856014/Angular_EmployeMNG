using EmployeeMNG.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeMNG.Service.Employees
{
    public interface IEmployeeService
    {
        IQueryable<Employee> GetAllEmp();
        void Create(Employee model);
        void Update(Employee employee);
            
        void Delete(int id);
        Employee GetEmpId(int id);
        IQueryable<Employee> GetEmpByDepId(int depId);
    }
}
