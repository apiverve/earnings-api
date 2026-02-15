# Earnings Report API - Go Client

Earnings Report is a tool for retrieving company financial data including income statement, balance sheet, and cash flow data from SEC filings. It supports lookup by ticker or CIK with optional year and quarter filters.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Go client for the [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=go&utm_medium=readme)

---

## Installation

```bash
go get github.com/apiverve/earnings-api/go
```

---

## Configuration

Before using the Earnings Report API client, you need to obtain your API key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=go&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=go&utm_medium=readme)

The Earnings Report API documentation is found here: [https://docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings?utm_source=go&utm_medium=readme)

---

## Usage

```go
package main

import (
    "fmt"
    "log"

    "github.com/apiverve/earnings-api/go"
)

func main() {
    // Create a new client
    client := earnings.NewClient("YOUR_API_KEY")

    // Set up parameters
    params := map[string]interface{}{
        "ticker": "ADBE",
        "year": 2025,
        "quarter": 2
    }

    // Make the request
    response, err := client.Execute(params)
    if err != nil {
        log.Fatal(err)
    }

    fmt.Printf("Status: %s\n", response.Status)
    fmt.Printf("Data: %+v\n", response.Data)
}
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
    "fiscalYear": 2025,
    "fiscalQuarter": 2,
    "filingType": "10-Q",
    "filingDate": "2025-06-25",
    "periodEnd": "2025-05-30",
    "income": {
      "revenue": 11587000000,
      "costOfRevenue": 1260000000,
      "grossProfit": 10327000000,
      "operatingIncome": 4272000000,
      "netIncome": 3502000000,
      "eps": 8.08,
      "epsBasic": 8.1,
      "sharesOutstanding": 433000000,
      "sharesOutstandingBasic": 432000000,
      "researchAndDevelopment": 2108000000,
      "sellingAndMarketing": 3121000000,
      "sellingGeneralAndAdmin": null,
      "generalAndAdmin": 744000000,
      "interestExpense": 68000000,
      "incomeTax": 781000000,
      "depreciation": 82000000,
      "stockBasedCompensation": null
    },
    "balance": {
      "totalAssets": 28107000000,
      "currentAssets": 8978000000,
      "cash": 4931000000,
      "receivables": 1735000000,
      "inventory": null,
      "propertyAndEquipment": 1890000000,
      "goodwill": 12830000000,
      "intangibles": 631000000,
      "totalLiabilities": 16659000000,
      "currentLiabilities": 9039000000,
      "accountsPayable": 360000000,
      "longTermDebt": 6166000000,
      "equity": 11448000000,
      "retainedEarnings": 41744000000
    },
    "cashFlow": {
      "operatingCashFlow": 4673000000,
      "capitalExpenditures": 73000000,
      "freeCashFlow": 4600000000,
      "investingCashFlow": -762000000,
      "financingCashFlow": -6629000000,
      "dividendsPaid": null,
      "shareRepurchases": 6750000000
    },
    "lastUpdated": "2026-02-05T08:00:00.000Z"
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=go&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=go&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=go&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=go&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
