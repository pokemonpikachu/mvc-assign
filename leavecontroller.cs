
using leave.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace leave.Controllers
{
    public class LeaveController : Controller
    {
        // GET: Leave
        DB01TEST01Entities db = new DB01TEST01Entities();
        public ActionResult register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult register(leave_mvc_328 l,employee_mvc_328 e)
        {
            if (!ModelState.IsValid)
            {
                ObjectParameter op1 = new ObjectParameter("slid", 0);
                TimeSpan diff = (l.leave_end_date - l.leave_start_date).Value;
                int d = Convert.ToInt16( diff.TotalDays);
                string status = "pending";
                //employee_mvc_328 e = new employee_mvc_328();
                //if( e.sick_bal>0 || e.casual_bal>0)
                {
                    db.sp_leave_mvc_register_328(l.leave_start_date, l.leave_end_date, l.leave_type, l.reason, d, l.eid, status, op1);
                    int id = Convert.ToInt32(op1.Value);
                    Response.Write("<script>alert('register succeesfully with leave id " + id + "')</script>");
                }
               // else
                    Response.Write("<script>alert('"+e.sick_bal+")</script>");


            }


            return View("register");
        }

    }
}
