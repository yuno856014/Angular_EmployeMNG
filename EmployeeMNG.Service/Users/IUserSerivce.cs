using EmployeeMNG.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeMNG.Service.Users
{
    public interface IUserService
    {
        IQueryable<User> GetAll();
    }
}
