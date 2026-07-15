declare module '@apiverve/earnings' {
  export interface earningsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface earningsResponse {
    status: string;
    error: string | null;
    data: EarningsReportData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface EarningsReportData {
      ticker:        null | string;
      company:       null | string;
      cik:           null | string;
      fiscalYear:    number | null;
      fiscalQuarter: number | null;
      filingType:    null | string;
      filingDate:    Date | null;
      periodEnd:     Date | null;
      income:        { [key: string]: number | null };
      balance:       { [key: string]: number | null };
      cashFlow:      CashFlow;
      metrics:       Metrics;
      lastUpdated:   Date | null;
  }
  
  interface CashFlow {
      operatingCashFlow:   number | null;
      capitalExpenditures: number | null;
      freeCashFlow:        number | null;
      investingCashFlow:   number | null;
      financingCashFlow:   number | null;
      dividendsPaid:       null;
      shareRepurchases:    number | null;
  }
  
  interface Metrics {
      grossMargin:      number | null;
      operatingMargin:  number | null;
      netMargin:        number | null;
      revenueFormatted: null | string;
  }

  export default class earningsWrapper {
    constructor(options: earningsOptions);

    execute(callback: (error: any, data: earningsResponse | null) => void): Promise<earningsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: earningsResponse | null) => void): Promise<earningsResponse>;
    execute(query?: Record<string, any>): Promise<earningsResponse>;
  }
}
