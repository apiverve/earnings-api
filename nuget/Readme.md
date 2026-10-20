Earnings Report API
============

Earnings Report returns a company's complete financial statements - income statement, balance sheet and cash flow together - in a single call from SEC filings, making it a one-stop earnings API for fundamental stock data. Look up by ticker or CIK; paid plans add calculated margins and year and quarter filters. For a single focused statement, see the Income Statement, Balance Sheet, Cash Flow and Financial Ratios APIs.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.EarningsReport.svg)](https://www.nuget.org/packages/APIVerve.API.EarningsReport)

This is a .NET wrapper for the [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.EarningsReport
```

Using the Package Manager:
```
nuget install APIVerve.API.EarningsReport
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.EarningsReport
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.EarningsReport"
5. Click on the APIVerve.API.EarningsReport package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Earnings Report API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.EarningsReport;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");

        var queryOptions = new EarningsReportQueryOptions {
            Ticker = "ADBE",
            Year = 0,
            Quarter = 0
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Earnings Report API documentation is found here: [https://docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Earnings Report API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.EarningsReport;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");

        var queryOptions = new EarningsReportQueryOptions {
            Ticker = "ADBE",
            Year = 0,
            Quarter = 0
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.EarningsReport;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");

        var queryOptions = new EarningsReportQueryOptions {
            Ticker = "ADBE",
            Year = 0,
            Quarter = 0
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.EarningsReport;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");

        var queryOptions = new EarningsReportQueryOptions {
            Ticker = "ADBE",
            Year = 0,
            Quarter = 0
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.EarningsReport;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new EarningsReportQueryOptions {
            Ticker = "ADBE",
            Year = 0,
            Quarter = 0
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new EarningsReportQueryOptions {
    Ticker = "ADBE",
    Year = 0,
    Quarter = 0
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new EarningsReportQueryOptions {
    Ticker = "ADBE",
    Year = 0,
    Quarter = 0
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new EarningsReportQueryOptions {
    Ticker = "ADBE",
    Year = 0,
    Quarter = 0
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new EarningsReportQueryOptions {
    Ticker = "ADBE",
    Year = 0,
    Quarter = 0
};

using (var apiClient = new EarningsReportAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "ticker": "ADBE",
    "company": "ADOBE INC.",
    "cik": "0000796343",
    "fiscalYear": 2026,
    "fiscalQuarter": 2,
    "filingType": "10-Q",
    "filingDate": "2026-06-15",
    "periodEnd": "2026-05-29",
    "income": {
      "revenue": 6618000000,
      "costOfRevenue": 715000000,
      "grossProfit": 5903000000,
      "operatingIncome": 2238000000,
      "netIncome": 1712000000,
      "eps": 4.25,
      "epsBasic": 4.26,
      "sharesOutstanding": 402500000,
      "sharesOutstandingBasic": 402400000,
      "researchAndDevelopment": null,
      "sellingAndMarketing": 1884000000,
      "sellingGeneralAndAdmin": null,
      "generalAndAdmin": 546000000,
      "interestExpense": null,
      "incomeTax": 526000000,
      "depreciation": 367000000,
      "stockBasedCompensation": 1043000000
    },
    "balance": {
      "totalAssets": 29933000000,
      "currentAssets": 9068000000,
      "cash": 4919000000,
      "receivables": 1993000000,
      "inventory": null,
      "propertyAndEquipment": 1870000000,
      "goodwill": 14041000000,
      "intangibles": 1012000000,
      "totalLiabilities": 18415000000,
      "currentLiabilities": 12078000000,
      "accountsPayable": 499000000,
      "longTermDebt": 4802000000,
      "equity": 11518000000,
      "retainedEarnings": 48767000000
    },
    "cashFlow": {
      "operatingCashFlow": 5123000000,
      "capitalExpenditures": 95000000,
      "freeCashFlow": 5028000000,
      "investingCashFlow": -1240000000,
      "financingCashFlow": -4399000000,
      "dividendsPaid": null,
      "shareRepurchases": 4589000000
    },
    "dividends": null,
    "lastUpdated": "2026-07-17T23:01:47.364Z",
    "metrics": {
      "grossMargin": 89.2,
      "operatingMargin": 33.82,
      "netMargin": 25.87,
      "revenueFormatted": "$6.62B"
    }
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
