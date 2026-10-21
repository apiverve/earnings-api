# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_earnings"
  spec.version       = "1.2.2"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Earnings Report API - Ruby Client"
  spec.description   = "Earnings Report returns a company's complete financial statements - income statement, balance sheet and cash flow together - in a single call from SEC filings, making it a one-stop earnings API for fundamental stock data. Look up by ticker or CIK; paid plans add calculated margins and year and quarter filters. For a single focused statement, see the Income Statement, Balance Sheet, Cash Flow and Financial Ratios APIs."
  spec.homepage      = "https://apiverve.com/marketplace/earnings?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/earnings-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/earnings"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
