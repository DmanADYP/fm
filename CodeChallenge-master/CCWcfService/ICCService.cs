using CCWcfService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CCWcfService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICCService" in both code and config file together.
    [ServiceContract]
    public interface ICCService
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "findall", RequestFormat = WebMessageFormat.Json)]
        List<Region> FindAll();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "find/{id}", RequestFormat = WebMessageFormat.Json)]
        Region find(string id);

        [OperationContract]
        [WebInvoke(Method = "CREATE", UriTemplate = "create", RequestFormat = WebMessageFormat.Json)]
        bool create(Region region);

        [OperationContract]
        [WebInvoke(Method = "DELETE", UriTemplate = "delete", RequestFormat = WebMessageFormat.Json)]
        bool delete(Region region);



    }
}
