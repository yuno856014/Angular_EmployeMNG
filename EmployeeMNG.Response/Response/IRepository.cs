using EmployeeMNG.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeMNG.Response.Response
{
    public interface IRepository<T> where T : Employee
    {
        IQueryable<T> GetAll();
        IQueryable<T> GetEmpByDepId(int depId);

        T Get(int Id);
        void Insert(T entity);
        void Update(T entity);
        void Delete(T entity);
        void Remove(T entity);
        void SaveChanges();
    }
}
