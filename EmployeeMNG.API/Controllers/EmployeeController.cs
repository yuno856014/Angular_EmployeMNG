using EmployeeMNG.API.Models;
using EmployeeMNG.Service.Employees;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeMNG.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmployeeController : Controller
    {
        private readonly IEmployeeService employeeService;
        private readonly IWebHostEnvironment webHost;

        public HRMContext Context { get; }

        public EmployeeController(IEmployeeService employeeService,HRMContext context,IWebHostEnvironment webHost)
        {
            this.employeeService = employeeService;
            Context = context;
            this.webHost = webHost;
        }
        [HttpGet(nameof(gettAllEmp))]
        public IActionResult gettAllEmp()
        {
            var emp = employeeService.GetAllEmp();
            if (emp is not null)
            {
                return Ok(emp);
            }
            return BadRequest("No records found");
        }
        [HttpPost("add_emp")]
        public IActionResult CreateEmp([FromBody]Employee model)
        {
            employeeService.Create(model);
            return new JsonResult("Thêm mới thành công!");
        }
        [HttpPut("update_emp")]
        public IActionResult Update(Employee model)
        {
            employeeService.Update(model);
            return new JsonResult("Chỉnh sửa thành công!");
        }
        [HttpDelete("delete_emp/{id}")]
        public IActionResult DeleteCustomer(int id)
        {
            employeeService.Delete(id);
            return new JsonResult("Nhân viên đã bị xóa!");

        }
        [HttpGet("getEmpId")]
        public IActionResult GetEmpId(int id)
        {
            var result = employeeService.GetEmpId(id);
            if (result is not null)
            {
                return Ok(result);
            }
            return BadRequest("No records found");
        }
        [HttpGet("getEmpByDepId")]
        public IActionResult GetEmpByDepId(int depId)
        {
            var result = employeeService.GetEmpByDepId(depId);
            if (result is not null)
            {
                return Ok(result);
            }
            return BadRequest("No records found");
        }
        [Route("SaveFile")]
        [HttpPost]
        public JsonResult SaveFile()
        {
            try
            {
                var httpRequest = Request.Form;
                var postedFile = httpRequest.Files[0];
                string filename = postedFile.FileName;
                var physicalPath = webHost.ContentRootPath + "/Photos/" + filename;

                using (var stream = new FileStream(physicalPath, FileMode.Create))
                {
                    postedFile.CopyTo(stream);
                }

                return new JsonResult(filename);
            }
            catch (Exception)
            {

                return new JsonResult("no_avatar.png");
            }
        }
    }
}
