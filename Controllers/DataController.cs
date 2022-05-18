using API_Vizsga.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Vizsga.Controllers
{
	[Route("api/[controller]")]
	[ApiController]

	public class DataController : ControllerBase
	{
		[HttpGet("getemployees")]
		public IActionResult GetEmployees()
		
		{
			try
			{
				using (SQL sql = new SQL())
				{
					List<Employee> e = sql.Employees.OrderBy(x => x.Name).ToList();
					return Ok(JsonConvert.SerializeObject(e));
				}
			}
			catch (Exception ex)
			{
				return BadRequest(ex.Message);
			}
		}

		[HttpPost("addnewemployee")]
		public IActionResult AddEmployee([FromBody] Employee employee)
		{
			try
			{
				using (SQL sql = new SQL())
				{
					sql.Employees.Add(employee);
					sql.SaveChanges();
					return Ok();
				}
			}
			catch (Exception ex)
			{
				return BadRequest(ex.Message);
			}
		}

		[HttpPost("addjobtype")]
		public IActionResult AddJobType([FromBody] JobType jobtype)
		{
			try
			{
				using (SQL sql = new SQL())
				{
					sql.JobTypes.Add(jobtype);
					sql.SaveChanges();
					return Ok();
				}
			}
			catch (Exception ex)
			{
				return BadRequest(ex.Message);
			}
		}

		[HttpGet("getjobtypes")]
		public IActionResult GetAllJobTypes()
		{
			try
			{
				using (SQL sql = new SQL())
				{
					List<JobType> e = sql.JobTypes.OrderBy(x => x.Name).ToList();
					return Ok(JsonConvert.SerializeObject(e));
				}
			}
			catch (Exception ex)
			{
				return BadRequest(ex.Message);
			}
		}
	}
}
