// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     EarningsReportData data = Converter.fromJsonString(jsonString);

package com.apiverve.earnings.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static EarningsReportData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(EarningsReportData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(EarningsReportData.class);
        writer = mapper.writerFor(EarningsReportData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// EarningsReportData.java

package com.apiverve.earnings.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.Map;

public class EarningsReportData {
    private String ticker;
    private String company;
    private String cik;
    private long fiscalYear;
    private long fiscalQuarter;
    private String filingType;
    private LocalDate filingDate;
    private LocalDate periodEnd;
    private Map<String, Double> income;
    private Map<String, Long> balance;
    private CashFlow cashFlow;
    private OffsetDateTime lastUpdated;

    @JsonProperty("ticker")
    public String getTicker() { return ticker; }
    @JsonProperty("ticker")
    public void setTicker(String value) { this.ticker = value; }

    @JsonProperty("company")
    public String getCompany() { return company; }
    @JsonProperty("company")
    public void setCompany(String value) { this.company = value; }

    @JsonProperty("cik")
    public String getCik() { return cik; }
    @JsonProperty("cik")
    public void setCik(String value) { this.cik = value; }

    @JsonProperty("fiscalYear")
    public long getFiscalYear() { return fiscalYear; }
    @JsonProperty("fiscalYear")
    public void setFiscalYear(long value) { this.fiscalYear = value; }

    @JsonProperty("fiscalQuarter")
    public long getFiscalQuarter() { return fiscalQuarter; }
    @JsonProperty("fiscalQuarter")
    public void setFiscalQuarter(long value) { this.fiscalQuarter = value; }

    @JsonProperty("filingType")
    public String getFilingType() { return filingType; }
    @JsonProperty("filingType")
    public void setFilingType(String value) { this.filingType = value; }

    @JsonProperty("filingDate")
    public LocalDate getFilingDate() { return filingDate; }
    @JsonProperty("filingDate")
    public void setFilingDate(LocalDate value) { this.filingDate = value; }

    @JsonProperty("periodEnd")
    public LocalDate getPeriodEnd() { return periodEnd; }
    @JsonProperty("periodEnd")
    public void setPeriodEnd(LocalDate value) { this.periodEnd = value; }

    @JsonProperty("income")
    public Map<String, Double> getIncome() { return income; }
    @JsonProperty("income")
    public void setIncome(Map<String, Double> value) { this.income = value; }

    @JsonProperty("balance")
    public Map<String, Long> getBalance() { return balance; }
    @JsonProperty("balance")
    public void setBalance(Map<String, Long> value) { this.balance = value; }

    @JsonProperty("cashFlow")
    public CashFlow getCashFlow() { return cashFlow; }
    @JsonProperty("cashFlow")
    public void setCashFlow(CashFlow value) { this.cashFlow = value; }

    @JsonProperty("lastUpdated")
    public OffsetDateTime getLastUpdated() { return lastUpdated; }
    @JsonProperty("lastUpdated")
    public void setLastUpdated(OffsetDateTime value) { this.lastUpdated = value; }
}

// CashFlow.java

package com.apiverve.earnings.data;

import com.fasterxml.jackson.annotation.*;

public class CashFlow {
    private long operatingCashFlow;
    private long capitalExpenditures;
    private long freeCashFlow;
    private long investingCashFlow;
    private long financingCashFlow;
    private Object dividendsPaid;
    private long shareRepurchases;

    @JsonProperty("operatingCashFlow")
    public long getOperatingCashFlow() { return operatingCashFlow; }
    @JsonProperty("operatingCashFlow")
    public void setOperatingCashFlow(long value) { this.operatingCashFlow = value; }

    @JsonProperty("capitalExpenditures")
    public long getCapitalExpenditures() { return capitalExpenditures; }
    @JsonProperty("capitalExpenditures")
    public void setCapitalExpenditures(long value) { this.capitalExpenditures = value; }

    @JsonProperty("freeCashFlow")
    public long getFreeCashFlow() { return freeCashFlow; }
    @JsonProperty("freeCashFlow")
    public void setFreeCashFlow(long value) { this.freeCashFlow = value; }

    @JsonProperty("investingCashFlow")
    public long getInvestingCashFlow() { return investingCashFlow; }
    @JsonProperty("investingCashFlow")
    public void setInvestingCashFlow(long value) { this.investingCashFlow = value; }

    @JsonProperty("financingCashFlow")
    public long getFinancingCashFlow() { return financingCashFlow; }
    @JsonProperty("financingCashFlow")
    public void setFinancingCashFlow(long value) { this.financingCashFlow = value; }

    @JsonProperty("dividendsPaid")
    public Object getDividendsPaid() { return dividendsPaid; }
    @JsonProperty("dividendsPaid")
    public void setDividendsPaid(Object value) { this.dividendsPaid = value; }

    @JsonProperty("shareRepurchases")
    public long getShareRepurchases() { return shareRepurchases; }
    @JsonProperty("shareRepurchases")
    public void setShareRepurchases(long value) { this.shareRepurchases = value; }
}