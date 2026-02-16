Earnings Report API
============

Earnings Report is a tool for retrieving company financial data including income statement, balance sheet, and cash flow data from SEC filings. It supports lookup by ticker or CIK with optional year and quarter filters.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=pypi&utm_medium=readme)

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

Before using the earnings API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient

# Initialize the client with your APIVerve API key
api = EarningsAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "ADBE",
    "year": 2025,
    "quarter": 2
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

The Earnings Report API documentation is found here: [https://docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings?utm_source=pypi&utm_medium=readme).
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
    "year": 2025,
    "quarter": 2
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

## Error Handling

The API client provides comprehensive error handling through the `EarningsAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_earningsreport.apiClient import EarningsAPIClient, EarningsAPIClientError

api = EarningsAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "ADBE",
    "year": 2025,
    "quarter": 2
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
    "year": 2025,
    "quarter": 2
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
    "year": 2025,
    "quarter": 2
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
    "year": 2025,
    "quarter": 2
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
    "year": 2025,
    "quarter": 2
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
