using RegionApp.Models;
using RegionApp.ModelView;
using RegionApp.Service;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace RegionApp.Controllers
{
    public class RegionController : Controller
    {
       private IRegionService _rc;
       private RegionModelView _rmv;
        public RegionController(IRegionService rc)
        {
            this._rc = rc;
            this._rmv = new RegionModelView();
        }

        [HttpGet]
        public ActionResult Index()
        {
           
            _rmv.lrm = _rc.FindAll();
            return View(_rmv);
        }

        [HttpGet]
        public ActionResult Create()
        {
            _rmv.lz = _rc.ZipFindAll();
            return View(_rmv);
        }
        [HttpPost]
        public ActionResult Create(RegionModelView rmv )
        {

            rmv.rm.ID = Guid.NewGuid().ToString();
           
            //rmv.rm.ZipCodes.Add(new ZipCodeModel
            //{
            //    Start = rmv.zcp.Start,
            //    End = rmv.zcp.End
            //});
            _rc.create(rmv.rm);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
           
            _rmv.rm = _rc.Find(id);
     
            return View("Edit", _rmv);
        }
        [HttpPost]
        public ActionResult Edit(RegionModelView rmv)
        {
            _rc.Edit(rmv.rm);
            return RedirectToAction("Index");
        }
        public ActionResult Delete(string id)
        {
            _rc.Delete(_rc.Find(id));
            return RedirectToAction("Index");

        }

    }
}