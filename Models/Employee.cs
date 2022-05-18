using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_Vizsga.Models
{
	[Table("Employees")]
	public class Employee
	{
		[Key]
		public int Id { get; set; }

		[Required]
		public string Name { get; set; }

		[Required]
		public string Address { get; set; }

		[Required]
		public DateTime BirthDate { get; set; }
		
		[Required]
		public int JobTypeId { get; set; }

	}
}
