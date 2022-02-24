using EmployeeMNG.API.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeMNG.Service.Departments
{
    public class DepartmentService : IDepartmentService
    {
        private readonly HRMContext _context;

        public DepartmentService(HRMContext hRMContext)
        {
            _context = hRMContext;
        }
        public IQueryable<Department> GetAll()
        {
            return _context.Departments.AsQueryable();
        }
    }
}
