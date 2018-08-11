using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReportTool.General
{
    class JsonHelperClass
    {
    }



    public class Datum
    {
        [JsonProperty("municipality.url")]
        public string municipalityurl { get; set; }
        [JsonProperty("municipality.demarcation_code")]
        public string municipalitydemarcation_code { get; set; }
        [JsonProperty("municipality.category")]
        public string municipalitycategory { get; set; }
        [JsonProperty("municipality.parent_code ")]
        public string municipalityparent_code { get; set; }
        [JsonProperty("municipality.postal_address_1")]
        public string municipalitypostal_address_1 { get; set; }
        [JsonProperty("municipality.long_name")]
        public string municipalitylong_name { get; set; }
        [JsonProperty("municipality.postal_address_3")]
        public string municipalitypostal_address_3 { get; set; }
        [JsonProperty("municipality.street_address_2")]
        public string municipalitystreet_address_2 { get; set; }
        [JsonProperty("municipality.province_code")]
        public string municipalityprovince_code { get; set; }
        [JsonProperty("municipality.phone_number")]
        public string municipalityphone_number { get; set; }
        [JsonProperty("municipality.fax_number")]
        public string municipalityfax_number { get; set; }
        [JsonProperty("municipality.street_address_3")]
        public string municipalitystreet_address_3 { get; set; }
        [JsonProperty("municipality.street_address_4")]
        public string municipalitystreet_address_4 { get; set; }
        public float area { get; set; }
        [JsonProperty("municipality.name")]
        public string municipalityname { get; set; }
        [JsonProperty("municipality.province_name")]
        public string municipalityprovince_name { get; set; }
        [JsonProperty("municipality.postal_address_2")]
        public string municipalitypostal_address_2 { get; set; }
        [JsonProperty("municipality.miif_category")]
        public string municipalitymiif_category { get; set; }
        [JsonProperty("municipality.street_address_1")]
        public string municipalitystreet_address_1 { get; set; }
    }



    public class Cell
    {
        public string @operator { get; set; }
        public List<string> value { get; set; }
        public string @ref { get; set; }
    }


    public class RootObject
    {
        public List<object> order { get; set; }
        public List<Cell> cell { get; set; }
        public List<Datum> data { get; set; }
        public int page { get; set; }
        public int total_fact_count { get; set; }
        public string status { get; set; }
        public List<string> fields { get; set; }
        public int page_size { get; set; }
    }

    public class RootofficialObject
    {
        public List<object> order { get; set; }
        public List<Cell> cell { get; set; }
        public List<Datumofficial> data { get; set; }
        public int page { get; set; }
        public int total_fact_count { get; set; }
        public string status { get; set; }
        public List<string> fields { get; set; }
        public int page_size { get; set; }
    }



    public class Datumofficial
    {
        [JsonProperty("role.role")]
        public string role { get; set; }
        [JsonProperty("municipality.demarcation_code")]
        public string demarcation_code { get; set; }
        [JsonProperty("contact_details.title")]
        public string title { get; set; }
        [JsonProperty("contact_details.phone_number")]
        public string phone_number { get; set; }
        [JsonProperty("contact_details.fax_number ")]
        public string fax_number { get; set; }
        [JsonProperty("contact_details.name ")]
        public string name { get; set; }
        [JsonProperty("contact_details.email_address")]
        public string email_address { get; set; }
    }

}
