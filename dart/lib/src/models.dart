/// Response models for the Earnings Report API.

/// API Response wrapper.
class EarningsResponse {
  final String status;
  final dynamic error;
  final EarningsData? data;

  EarningsResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory EarningsResponse.fromJson(Map<String, dynamic> json) => EarningsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? EarningsData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Earnings Report API.

class EarningsData {
  String? ticker;
  String? company;
  String? cik;
  int? fiscalYear;
  int? fiscalQuarter;
  String? filingType;
  String? filingDate;
  String? periodEnd;
  EarningsDataIncome? income;
  EarningsDataBalance? balance;
  EarningsDataCashflow? cashFlow;
  String? lastUpdated;

  EarningsData({
    this.ticker,
    this.company,
    this.cik,
    this.fiscalYear,
    this.fiscalQuarter,
    this.filingType,
    this.filingDate,
    this.periodEnd,
    this.income,
    this.balance,
    this.cashFlow,
    this.lastUpdated,
  });

  factory EarningsData.fromJson(Map<String, dynamic> json) => EarningsData(
      ticker: json['ticker'],
      company: json['company'],
      cik: json['cik'],
      fiscalYear: json['fiscalYear'],
      fiscalQuarter: json['fiscalQuarter'],
      filingType: json['filingType'],
      filingDate: json['filingDate'],
      periodEnd: json['periodEnd'],
      income: json['income'] != null ? EarningsDataIncome.fromJson(json['income']) : null,
      balance: json['balance'] != null ? EarningsDataBalance.fromJson(json['balance']) : null,
      cashFlow: json['cashFlow'] != null ? EarningsDataCashflow.fromJson(json['cashFlow']) : null,
      lastUpdated: json['lastUpdated'],
    );
}

class EarningsDataIncome {
  int? revenue;
  int? costOfRevenue;
  int? grossProfit;
  int? operatingIncome;
  int? netIncome;
  double? eps;
  double? epsBasic;
  int? sharesOutstanding;
  int? sharesOutstandingBasic;
  int? researchAndDevelopment;
  int? sellingAndMarketing;
  dynamic sellingGeneralAndAdmin;
  int? generalAndAdmin;
  int? interestExpense;
  int? incomeTax;
  int? depreciation;
  dynamic stockBasedCompensation;

  EarningsDataIncome({
    this.revenue,
    this.costOfRevenue,
    this.grossProfit,
    this.operatingIncome,
    this.netIncome,
    this.eps,
    this.epsBasic,
    this.sharesOutstanding,
    this.sharesOutstandingBasic,
    this.researchAndDevelopment,
    this.sellingAndMarketing,
    this.sellingGeneralAndAdmin,
    this.generalAndAdmin,
    this.interestExpense,
    this.incomeTax,
    this.depreciation,
    this.stockBasedCompensation,
  });

  factory EarningsDataIncome.fromJson(Map<String, dynamic> json) => EarningsDataIncome(
      revenue: json['revenue'],
      costOfRevenue: json['costOfRevenue'],
      grossProfit: json['grossProfit'],
      operatingIncome: json['operatingIncome'],
      netIncome: json['netIncome'],
      eps: json['eps'],
      epsBasic: json['epsBasic'],
      sharesOutstanding: json['sharesOutstanding'],
      sharesOutstandingBasic: json['sharesOutstandingBasic'],
      researchAndDevelopment: json['researchAndDevelopment'],
      sellingAndMarketing: json['sellingAndMarketing'],
      sellingGeneralAndAdmin: json['sellingGeneralAndAdmin'],
      generalAndAdmin: json['generalAndAdmin'],
      interestExpense: json['interestExpense'],
      incomeTax: json['incomeTax'],
      depreciation: json['depreciation'],
      stockBasedCompensation: json['stockBasedCompensation'],
    );
}

class EarningsDataBalance {
  int? totalAssets;
  int? currentAssets;
  int? cash;
  int? receivables;
  dynamic inventory;
  int? propertyAndEquipment;
  int? goodwill;
  int? intangibles;
  int? totalLiabilities;
  int? currentLiabilities;
  int? accountsPayable;
  int? longTermDebt;
  int? equity;
  int? retainedEarnings;

  EarningsDataBalance({
    this.totalAssets,
    this.currentAssets,
    this.cash,
    this.receivables,
    this.inventory,
    this.propertyAndEquipment,
    this.goodwill,
    this.intangibles,
    this.totalLiabilities,
    this.currentLiabilities,
    this.accountsPayable,
    this.longTermDebt,
    this.equity,
    this.retainedEarnings,
  });

  factory EarningsDataBalance.fromJson(Map<String, dynamic> json) => EarningsDataBalance(
      totalAssets: json['totalAssets'],
      currentAssets: json['currentAssets'],
      cash: json['cash'],
      receivables: json['receivables'],
      inventory: json['inventory'],
      propertyAndEquipment: json['propertyAndEquipment'],
      goodwill: json['goodwill'],
      intangibles: json['intangibles'],
      totalLiabilities: json['totalLiabilities'],
      currentLiabilities: json['currentLiabilities'],
      accountsPayable: json['accountsPayable'],
      longTermDebt: json['longTermDebt'],
      equity: json['equity'],
      retainedEarnings: json['retainedEarnings'],
    );
}

class EarningsDataCashflow {
  int? operatingCashFlow;
  int? capitalExpenditures;
  int? freeCashFlow;
  int? investingCashFlow;
  int? financingCashFlow;
  dynamic dividendsPaid;
  int? shareRepurchases;

  EarningsDataCashflow({
    this.operatingCashFlow,
    this.capitalExpenditures,
    this.freeCashFlow,
    this.investingCashFlow,
    this.financingCashFlow,
    this.dividendsPaid,
    this.shareRepurchases,
  });

  factory EarningsDataCashflow.fromJson(Map<String, dynamic> json) => EarningsDataCashflow(
      operatingCashFlow: json['operatingCashFlow'],
      capitalExpenditures: json['capitalExpenditures'],
      freeCashFlow: json['freeCashFlow'],
      investingCashFlow: json['investingCashFlow'],
      financingCashFlow: json['financingCashFlow'],
      dividendsPaid: json['dividendsPaid'],
      shareRepurchases: json['shareRepurchases'],
    );
}

class EarningsRequest {
  String ticker;
  int? year;
  int? quarter;

  EarningsRequest({
    required this.ticker,
    this.year,
    this.quarter,
  });

  Map<String, dynamic> toJson() => {
      'ticker': ticker,
      if (year != null) 'year': year,
      if (quarter != null) 'quarter': quarter,
    };
}
