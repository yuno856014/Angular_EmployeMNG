using EmployeeMNG.API.Models;
using EmployeeMNG.Service.Users;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeMNG.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LoginController : Controller
    {
        private readonly HRMContext _context;
        private readonly IUserService userService;

        public LoginController(HRMContext hRMContext,IUserService userService)
        {
            _context = hRMContext;
            this.userService = userService;
        }
        [HttpGet("users")]
        public IActionResult GetUser()
        {
            return Ok(userService.GetAll());
        }
        [HttpPost("login")]
        public IActionResult Login([FromBody] User user)
        {
            if(user == null)
            {
                return BadRequest();
            }
            else
            {
                var users = _context.Users.Where(c => c.UserName == user.UserName && c.Password == user.Password).FirstOrDefault();
                if(user != null)
                {
                    return Ok(new
                    {
                        StatusCode = 200,
                        Message = "Đăng nhập thành công!"
                    });
                }
                else
                {
                    return NotFound(new
                    {
                        StatusCode = 404,
                        Message = "Người dùng không tồn tại!"
                    });
                }    
            }
        }
    }
}
