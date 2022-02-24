using EmployeeMNG.API.Models;
using EmployeeMNG.Service.Departments;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeMNG.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DepartmentController : Controller
    {
        private readonly IDepartmentService departmentService;
        private readonly HRMContext _context;

        public DepartmentController(IDepartmentService departmentService,
                                    HRMContext hRMContext)
        {
            this.departmentService = departmentService;
            _context = hRMContext;
        }
        [HttpGet(nameof(GetAllDepartment))]
        public IActionResult GetAllDepartment()
        {
            
            var dep = departmentService.GetAll();
            if (dep is not null)
            {
                return Ok(dep);
            }
            return BadRequest("No records found");

        }
    }
}
