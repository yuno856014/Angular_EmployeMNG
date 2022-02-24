using EmployeeMNG.API.Models;
using EmployeeMNG.Response.Response;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeMNG.Service.Employees
{
    public class EmloyeeService : IEmployeeService
    {
        private readonly IRepository<Employee> _repository;

        public EmloyeeService(IRepository<Employee> repository)
        {
            _repository = repository;
        }

        public void Create(Employee model)
        {
            _repository.Insert(model);
        }

        public void Delete(int id)
        {

            Employee employee = GetEmpId(id);
            _repository.Remove(employee);
            _repository.SaveChanges();
        }

        public IQueryable<Employee> GetAllEmp()
        {
            return _repository.GetAll();
        }

        public IQueryable<Employee> GetEmpByDepId(int depId)
        {
            return _repository.GetEmpByDepId(depId);
        }

        public Employee GetEmpId(int id)
        {
            return _repository.Get(id);
        }

        public void Update(Employee employee)
        {
            _repository.Update(employee);
        }

    }
}
