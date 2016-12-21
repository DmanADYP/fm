using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WcfServiceCC.Model;

namespace WcfServiceCC.Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IServiceRegions" in both code and config file together.
    [ServiceContract]
    public interface IServiceRegions
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "findall", ResponseFormat =
            WebMessageFormat.Json)]
        List<RegionModel> FindAll();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "find/{id}", ResponseFormat =
            WebMessageFormat.Json)]
        RegionModel Find(string id);


        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "create", ResponseFormat =
            WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        bool create(RegionModel region);

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "edit", ResponseFormat =
            WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json)]
        bool Edit(RegionModel Region);

        [OperationContract]
        [WebInvoke(Method = "DELETE", UriTemplate = "delete", RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json)]
       bool Delete(RegionModel Region);

        //ZipCodes

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "zipfindall", ResponseFormat =
            WebMessageFormat.Json)]
        List<ZipModel> ZipFindAll();

       



    }
}
