﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capstone.Web.Models;

namespace Capstone.Web.DAL
{
    public interface IUserDAL
    {
       bool CreateUser(Users user);
    }
}
