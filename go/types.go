// Package earnings provides a Go client for the Earnings Report API.
//
// For more information, visit: https://apiverve.com/marketplace/earnings?utm_source=go&utm_medium=readme
package earnings

import (
	"fmt"
	"reflect"
	"regexp"
	"strings"
)

// ValidationRule defines validation constraints for a parameter.
type ValidationRule struct {
	Type      string
	Required  bool
	Min       *float64
	Max       *float64
	MinLength *int
	MaxLength *int
	Format    string
	Enum      []string
}

// ValidationError represents a parameter validation error.
type ValidationError struct {
	Errors []string
}

func (e *ValidationError) Error() string {
	return "Validation failed: " + strings.Join(e.Errors, "; ")
}

// Helper functions for pointers
func float64Ptr(v float64) *float64 { return &v }
func intPtr(v int) *int             { return &v }

// Format validation patterns
var formatPatterns = map[string]*regexp.Regexp{
	"email":    regexp.MustCompile(`^[^\s@]+@[^\s@]+\.[^\s@]+$`),
	"url":      regexp.MustCompile(`^https?://.+`),
	"ip":       regexp.MustCompile(`^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`),
	"date":     regexp.MustCompile(`^\d{4}-\d{2}-\d{2}$`),
	"hexColor": regexp.MustCompile(`^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$`),
}

// Request contains the parameters for the Earnings Report API.
//
// Parameters:
//   - ticker (required): string - Stock ticker symbol (e.g. AAPL, MSFT, ADBE) [minLength: 1, maxLength: 5]
//   - year: integer - Fiscal year to retrieve. Defaults to latest available. [min: 2000, max: 2030]
//   - quarter: integer - Fiscal quarter to retrieve. Defaults to latest available. [min: 1, max: 4]
type Request struct {
	Ticker string `json:"ticker"` // Required
	Year int `json:"year,omitempty"` // Optional
	Quarter int `json:"quarter,omitempty"` // Optional
}

// ToQueryParams converts the request struct to a map of query parameters.
// Only non-zero values are included.
func (r *Request) ToQueryParams() map[string]string {
	params := make(map[string]string)
	if r == nil {
		return params
	}

	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		// Get the json tag for the field name
		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		// Handle tags like `json:"name,omitempty"`
		jsonName := strings.Split(jsonTag, ",")[0]
		if jsonName == "-" {
			continue
		}

		// Skip zero values
		if field.IsZero() {
			continue
		}

		// Convert to string
		params[jsonName] = fmt.Sprintf("%v", field.Interface())
	}

	return params
}

// Validate checks the request parameters against validation rules.
// Returns a ValidationError if validation fails, nil otherwise.
func (r *Request) Validate() error {
	rules := map[string]ValidationRule{
		"ticker": {Type: "string", Required: true, MinLength: intPtr(1), MaxLength: intPtr(5)},
		"year": {Type: "integer", Required: false, Min: float64Ptr(2000), Max: float64Ptr(2030)},
		"quarter": {Type: "integer", Required: false, Min: float64Ptr(1), Max: float64Ptr(4)},
	}

	if len(rules) == 0 {
		return nil
	}

	var errors []string
	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		jsonName := strings.Split(jsonTag, ",")[0]

		rule, exists := rules[jsonName]
		if !exists {
			continue
		}

		// Check required
		if rule.Required && field.IsZero() {
			errors = append(errors, fmt.Sprintf("Required parameter [%s] is missing", jsonName))
			continue
		}

		if field.IsZero() {
			continue
		}

		// Type-specific validation
		switch rule.Type {
		case "integer", "number":
			var numVal float64
			switch field.Kind() {
			case reflect.Int, reflect.Int64:
				numVal = float64(field.Int())
			case reflect.Float64:
				numVal = field.Float()
			}
			if rule.Min != nil && numVal < *rule.Min {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %v", jsonName, *rule.Min))
			}
			if rule.Max != nil && numVal > *rule.Max {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %v", jsonName, *rule.Max))
			}

		case "string":
			strVal := field.String()
			if rule.MinLength != nil && len(strVal) < *rule.MinLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %d characters", jsonName, *rule.MinLength))
			}
			if rule.MaxLength != nil && len(strVal) > *rule.MaxLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %d characters", jsonName, *rule.MaxLength))
			}
			if rule.Format != "" {
				if pattern, ok := formatPatterns[rule.Format]; ok {
					if !pattern.MatchString(strVal) {
						errors = append(errors, fmt.Sprintf("Parameter [%s] must be a valid %s", jsonName, rule.Format))
					}
				}
			}
		}

		// Enum validation
		if len(rule.Enum) > 0 {
			strVal := fmt.Sprintf("%v", field.Interface())
			found := false
			for _, enumVal := range rule.Enum {
				if strVal == enumVal {
					found = true
					break
				}
			}
			if !found {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be one of: %s", jsonName, strings.Join(rule.Enum, ", ")))
			}
		}
	}

	if len(errors) > 0 {
		return &ValidationError{Errors: errors}
	}
	return nil
}

// ResponseData contains the data returned by the Earnings Report API.
type ResponseData struct {
	Ticker string `json:"ticker"`
	Company string `json:"company"`
	Cik string `json:"cik"`
	FiscalYear int `json:"fiscalYear"`
	FiscalQuarter int `json:"fiscalQuarter"`
	FilingType string `json:"filingType"`
	FilingDate string `json:"filingDate"`
	PeriodEnd string `json:"periodEnd"`
	Income IncomeData `json:"income"`
	Balance BalanceData `json:"balance"`
	CashFlow CashFlowData `json:"cashFlow"`
	LastUpdated string `json:"lastUpdated"`
}

// IncomeData represents the income object.
type IncomeData struct {
	Revenue int `json:"revenue"`
	CostOfRevenue int `json:"costOfRevenue"`
	GrossProfit int `json:"grossProfit"`
	OperatingIncome int `json:"operatingIncome"`
	NetIncome int `json:"netIncome"`
	Eps float64 `json:"eps"`
	EpsBasic float64 `json:"epsBasic"`
	SharesOutstanding int `json:"sharesOutstanding"`
	SharesOutstandingBasic int `json:"sharesOutstandingBasic"`
	ResearchAndDevelopment int `json:"researchAndDevelopment"`
	SellingAndMarketing int `json:"sellingAndMarketing"`
	SellingGeneralAndAdmin interface{} `json:"sellingGeneralAndAdmin"`
	GeneralAndAdmin int `json:"generalAndAdmin"`
	InterestExpense int `json:"interestExpense"`
	IncomeTax int `json:"incomeTax"`
	Depreciation int `json:"depreciation"`
	StockBasedCompensation interface{} `json:"stockBasedCompensation"`
}

// BalanceData represents the balance object.
type BalanceData struct {
	TotalAssets int `json:"totalAssets"`
	CurrentAssets int `json:"currentAssets"`
	Cash int `json:"cash"`
	Receivables int `json:"receivables"`
	Inventory interface{} `json:"inventory"`
	PropertyAndEquipment int `json:"propertyAndEquipment"`
	Goodwill int `json:"goodwill"`
	Intangibles int `json:"intangibles"`
	TotalLiabilities int `json:"totalLiabilities"`
	CurrentLiabilities int `json:"currentLiabilities"`
	AccountsPayable int `json:"accountsPayable"`
	LongTermDebt int `json:"longTermDebt"`
	Equity int `json:"equity"`
	RetainedEarnings int `json:"retainedEarnings"`
}

// CashFlowData represents the cashFlow object.
type CashFlowData struct {
	OperatingCashFlow int `json:"operatingCashFlow"`
	CapitalExpenditures int `json:"capitalExpenditures"`
	FreeCashFlow int `json:"freeCashFlow"`
	InvestingCashFlow int `json:"investingCashFlow"`
	FinancingCashFlow int `json:"financingCashFlow"`
	DividendsPaid interface{} `json:"dividendsPaid"`
	ShareRepurchases int `json:"shareRepurchases"`
}
