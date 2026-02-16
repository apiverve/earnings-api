# Earnings Report API - Dart/Flutter Client

Earnings Report is a tool for retrieving company financial data including income statement, balance sheet, and cash flow data from SEC filings. It supports lookup by ticker or CIK with optional year and quarter filters.

[![pub package](https://img.shields.io/pub/v/apiverve_earnings.svg)](https://pub.dev/packages/apiverve_earnings)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_earnings: ^1.1.14
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
      'year': 2025,
      'quarter': 2
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

## API Reference

- **API Home:** [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
