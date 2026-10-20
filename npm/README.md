# Earnings Report API

Earnings Report returns a company's complete financial statements - income statement, balance sheet and cash flow together - in a single call from SEC filings, making it a one-stop earnings API for fundamental stock data. Look up by ticker or CIK; paid plans add calculated margins and year and quarter filters. For a single focused statement, see the Income Statement, Balance Sheet, Cash Flow and Financial Ratios APIs.

[![npm version](https://img.shields.io/npm/v/@apiverve/earnings.svg)](https://www.npmjs.com/package/@apiverve/earnings)

This is a JavaScript wrapper for the [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/earnings
```

Using yarn:
```shell
yarn add @apiverve/earnings
```

---

## Configuration

Before using the Earnings Report API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Earnings Report API documentation is found here: [https://docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const earningsAPI = require('@apiverve/earnings');
const api = new earningsAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  ticker: "ADBE",
  year: 0,
  quarter: 0
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  ticker: "ADBE",
  year: 0,
  quarter: 0
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  ticker: "ADBE",
  year: 0,
  quarter: 0
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
