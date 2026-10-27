Pod::Spec.new do |s|
  s.name             = 'APIVerveEarningsReport'
  s.version          = '1.2.3'
  s.summary          = 'Earnings Report returns a company\'s complete financial statements - income statement, balance sheet and cash flow together - in a single...'
  s.description      = <<-'DESC'
Earnings Report returns a company's complete financial statements - income statement, balance sheet and cash flow together - in a single call from SEC filings, making it a one-stop earnings API for fundamental stock data. Look up by ticker or CIK; paid plans add calculated margins and year and quarter filters. For a single focused statement, see the Income Statement, Balance Sheet, Cash Flow and Financial Ratios APIs.

This iOS/macOS SDK provides a convenient way to access the Earnings Report from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/earnings?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/earnings-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveEarningsReport/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
