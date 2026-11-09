# Earnings Report API - Dart/Flutter Client

Earnings Report returns a company's complete financial statements - income statement, balance sheet and cash flow together - in a single call from SEC filings, making it a one-stop earnings API for fundamental stock data. Look up by ticker or CIK; paid plans add calculated margins and year and quarter filters. For a single focused statement, see the Income Statement, Balance Sheet, Cash Flow and Financial Ratios APIs.

[![pub package](https://img.shields.io/pub/v/apiverve_earnings.svg)](https://pub.dev/packages/apiverve_earnings)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_earnings: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_earnings/apiverve_earnings.dart';

void main() async {
  final client = EarningsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'ticker': 'ADBE',
      'year': 0,
      'quarter': 0
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
