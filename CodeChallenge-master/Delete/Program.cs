using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CodeChallenge.Data.Repositories;
using CodeChallenge.Entities;

namespace Delete
{
    class Program
    {
        static void Main(string[] args)
        {
            Program p = new Program();
            p.run();
        }
        public void run()
        {
            RegionRepository r = new RegionRepository();
            Region reg = new Region();
            r.Add(reg);
        }
    }
}
