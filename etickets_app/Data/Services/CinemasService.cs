using eTickets.Data;
using eTickets.Data.Base;
using eTickets.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace etickets_app.Data.Services
{
    public class CinemasService: EntityBaseRepository<Cinema>, ICinemasService
    {
        public CinemasService(AppDbContext context) : base(context)
        {

        }
    }
}
