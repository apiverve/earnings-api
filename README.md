# [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)

Earnings Report is a tool for retrieving company financial data including income statement, balance sheet, and cash flow data from SEC filings. It supports lookup by ticker or CIK with optional year and quarter filters.

The Earnings Report API provides a simple, reliable way to integrate earnings report functionality into your applications. Built for developers who need production-ready earnings report capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/earnings?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/earnings?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/earnings)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.EarningsReport)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-earnings/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_earnings)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/earnings)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_earnings)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callEarningsReportAPI() {
    try {
        const params = new URLSearchParams({
            ticker: 'ADBE'
        });

        const response = await fetch(`https://api.apiverve.com/v1/earnings?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callEarningsReportAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/earnings?ticker=ADBE" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/earnings
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/earnings) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.EarningsReport
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.EarningsReport) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-earnings
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-earnings/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_earnings
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_earnings) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/earnings
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/earnings) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_earnings
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_earnings) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:earnings-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/earnings-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/earnings](https://docs.apiverve.com/ref/earnings)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Earnings Report API is commonly used for:

- **Web Applications** - Add earnings report features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with earnings report capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Earnings Report API:

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

---

## Support & Community

- 🏠 **API Home**: [Earnings Report API](https://apiverve.com/marketplace/earnings?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
