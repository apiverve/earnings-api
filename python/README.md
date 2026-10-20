Earnings Report API
============

Earnings Report returns a company's complete financial statements - income statement, balance sheet and cash flow together - in a single call from SEC filings, making it a one-stop earnings API for fundamental stock data. Look up by ticker or CIK; paid plans add calculated margins and year and quarter filters. For a single focused statement, see the Income Statement, Balance Sheet, Cash Flow and Financial Ratios APIs.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-earningsreport.svg)](https://pypi.org/project/apiverve-earningsreport/)

This is a Python wrapper for the [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-earningsreport
```

Using `pip3`:

```bash
pip3 install apiverve-earningsreport
```

---

## Configuration

Before using the Earnings Report API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient

# Initialize the client with your APIVerve API key
api = EarningsAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "ADBE",
    "year": 0,
    "quarter": 0
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Earnings Report API documentation is found here: [https://docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_earningsreport.apiClient import EarningsAPIClient

# Initialize the client with your APIVerve API key
api = EarningsAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "ticker": "ADBE",
    "year": 0,
    "quarter": 0
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

## Error Handling

The API client provides comprehensive error handling through the `EarningsAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient, EarningsAPIClientError

api = EarningsAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "ADBE",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except EarningsAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient, EarningsAPIClientError

api = EarningsAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "ADBE",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except EarningsAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient, EarningsAPIClientError

query = {
    "ticker": "ADBE",
    "year": 0,
    "quarter": 0
}

# Using context manager ensures proper cleanup
with EarningsAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except EarningsAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient

# Enable debug mode
api = EarningsAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "ticker": "ADBE",
    "year": 0,
    "quarter": 0
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient

api = EarningsAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "ADBE",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
