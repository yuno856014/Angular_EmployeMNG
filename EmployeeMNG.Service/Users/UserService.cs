using EmployeeMNG.API.Models;
using EmployeeMNG.Response.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeMNG.Service.Users
{
    public class UserService : IUserService
    {
        private readonly HRMContext _context;

        public UserService(HRMContext _context)
        {
            this._context = _context;
        }
        public IQueryable<User> GetAll()
        {
            return _context.Users.AsQueryable();
        }
    }
}
