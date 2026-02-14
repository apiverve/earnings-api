declare module '@apiverve/earnings' {
  export interface earningsOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface earningsResponse {
    status: string;
    error: string | null;
    data: EarningsReportData;
    code?: number;
  }


  interface EarningsReportData {
      ticker:        string;
      company:       string;
      cik:           string;
      fiscalYear:    number;
      fiscalQuarter: number;
      filingType:    string;
      filingDate:    Date;
      periodEnd:     Date;
      income:        { [key: string]: number | null };
      balance:       { [key: string]: number | null };
      cashFlow:      CashFlow;
      lastUpdated:   Date;
  }
  
  interface CashFlow {
      operatingCashFlow:   number;
      capitalExpenditures: number;
      freeCashFlow:        number;
      investingCashFlow:   number;
      financingCashFlow:   number;
      dividendsPaid:       null;
      shareRepurchases:    number;
  }

  export default class earningsWrapper {
    constructor(options: earningsOptions);

    execute(callback: (error: any, data: earningsResponse | null) => void): Promise<earningsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: earningsResponse | null) => void): Promise<earningsResponse>;
    execute(query?: Record<string, any>): Promise<earningsResponse>;
  }
}
