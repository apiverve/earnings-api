/// Response models for the Earnings Report API.

/// API Response wrapper.
class EarningsResponse {
  final String status;
  final dynamic error;
  final EarningsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  EarningsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory EarningsResponse.fromJson(Map<String, dynamic> json) => EarningsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? EarningsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Earnings Report API.

class EarningsData {
  String? ticker;
  String? company;
  String? cik;
  num? fiscalYear;
  num? fiscalQuarter;
  String? filingType;
  String? filingDate;
  String? periodEnd;
  EarningsDataIncome? income;
  EarningsDataBalance? balance;
  EarningsDataCashflow? cashFlow;
  dynamic dividends;
  String? lastUpdated;
  EarningsDataMetrics? metrics;

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
    this.dividends,
    this.lastUpdated,
    this.metrics,
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
      dividends: json['dividends'],
      lastUpdated: json['lastUpdated'],
      metrics: json['metrics'] != null ? EarningsDataMetrics.fromJson(json['metrics']) : null,
    );
}

class EarningsDataIncome {
  num? revenue;
  num? costOfRevenue;
  num? grossProfit;
  num? operatingIncome;
  num? netIncome;
  num? eps;
  num? epsBasic;
  num? sharesOutstanding;
  num? sharesOutstandingBasic;
  dynamic researchAndDevelopment;
  num? sellingAndMarketing;
  dynamic sellingGeneralAndAdmin;
  num? generalAndAdmin;
  dynamic interestExpense;
  num? incomeTax;
  num? depreciation;
  num? stockBasedCompensation;

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
  num? totalAssets;
  num? currentAssets;
  num? cash;
  num? receivables;
  dynamic inventory;
  num? propertyAndEquipment;
  num? goodwill;
  num? intangibles;
  num? totalLiabilities;
  num? currentLiabilities;
  num? accountsPayable;
  num? longTermDebt;
  num? equity;
  num? retainedEarnings;

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
  num? operatingCashFlow;
  num? capitalExpenditures;
  num? freeCashFlow;
  num? investingCashFlow;
  num? financingCashFlow;
  dynamic dividendsPaid;
  num? shareRepurchases;

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

class EarningsDataMetrics {
  num? grossMargin;
  num? operatingMargin;
  num? netMargin;
  String? revenueFormatted;

  EarningsDataMetrics({
    this.grossMargin,
    this.operatingMargin,
    this.netMargin,
    this.revenueFormatted,
  });

  factory EarningsDataMetrics.fromJson(Map<String, dynamic> json) => EarningsDataMetrics(
      grossMargin: json['grossMargin'],
      operatingMargin: json['operatingMargin'],
      netMargin: json['netMargin'],
      revenueFormatted: json['revenueFormatted'],
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
