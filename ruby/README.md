# Earnings Report API - Ruby Gem

Earnings Report returns a company's complete financial statements - income statement, balance sheet and cash flow together - in a single call from SEC filings, making it a one-stop earnings API for fundamental stock data. Look up by ticker or CIK; paid plans add calculated margins and year and quarter filters. For a single focused statement, see the Income Statement, Balance Sheet, Cash Flow and Financial Ratios APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_earnings'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_earnings
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_earnings'

# Initialize the client
client = APIVerve::Earnings::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  ticker: "ADBE",
  year: 0,
  quarter: 0
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ ticker: "ADBE", year: 0, quarter: 0 })
  puts response["data"]
rescue APIVerve::Earnings::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Earnings::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Earnings::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/earnings?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/earnings?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/earnings?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
