# Earnings Report API - PHP Package

Earnings Report is a tool for retrieving company financial data including income statement, balance sheet, and cash flow data from SEC filings. It supports lookup by ticker or CIK with optional year and quarter filters.

## Installation

Install via Composer:

```bash
composer require apiverve/earnings
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Earnings\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'ticker' => 'ADBE',
    'year' => 2024,
    'quarter' => 2
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Earnings\Client;
use APIVerve\Earnings\Exceptions\APIException;
use APIVerve\Earnings\Exceptions\ValidationException;

try {
    $response = $client->execute(['ticker' => 'ADBE', 'year' => 2024, 'quarter' => 2]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

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
    "metrics": {
      "grossMargin": 89.12,
      "operatingMargin": 36.87,
      "netMargin": 30.22,
      "revenueFormatted": "$11.59B"
    },
    "lastUpdated": "2026-02-05T08:00:00.000Z"
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/earnings?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/earnings?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/earnings?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
