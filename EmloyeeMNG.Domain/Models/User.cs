﻿using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeMNG.API.Models
{
    public partial class User
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Mobile { get; set; }
        public string UserType { get; set; }
    }
}
