﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WcfServiceCC.Repository
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RegionEntities : DbContext
    {
        public RegionEntities()
            : base("name=RegionEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Region> Regions { get; set; }
        public DbSet<ZipCode> ZipCodes { get; set; }
        public DbSet<Zip> Zips { get; set; }
        public DbSet<RegionZipCode> RegionZipCodes { get; set; }
    }
}
