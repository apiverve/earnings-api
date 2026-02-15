using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.EarningsReport
{
    /// <summary>
    /// Query options for the Earnings Report API
    /// </summary>
    public class EarningsReportQueryOptions
    {
        /// <summary>
        /// Stock ticker symbol (e.g. AAPL, MSFT, ADBE)
        /// </summary>
        [JsonProperty("ticker")]
        public string Ticker { get; set; }

        /// <summary>
        /// Fiscal year to retrieve. Defaults to latest available.
        /// </summary>
        [JsonProperty("year")]
        public string Year { get; set; }

        /// <summary>
        /// Fiscal quarter to retrieve. Defaults to latest available.
        /// </summary>
        [JsonProperty("quarter")]
        public string Quarter { get; set; }
    }
}
