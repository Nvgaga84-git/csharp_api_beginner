using API_Vizsga.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Vizsga	
{
	class SQL : DbContext
	{
		private static string MSSQLConnectionString = "Server=localhost;Database=VizsgaAdatbazis;Trusted_Connection=true;MultipleActiveResultSets=true";
		private static string MySQLConnectionString = "";

		/// <summary>
		/// Törölje a két sor kommentjeit, amennyiben MS SQL szervert használ
		/// </summary>
		public SQL():base(new DbContextOptionsBuilder().UseSqlServer(SQL.MSSQLConnectionString).Options)
		{}



		/// <summary>
		/// Törölje a két sor kommentjeit, amennyiben MS SQL szervert használ
		/// </summary>
		//public SQL() : base(new DbContextOptionsBuilder().UseMySQL(SQL.MySQLConnectionString).Options)
		//{}

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			
		}

		public DbSet<Employee> Employees { get; set; }
		public DbSet<JobType> JobTypes { get; set; }
	}
}
