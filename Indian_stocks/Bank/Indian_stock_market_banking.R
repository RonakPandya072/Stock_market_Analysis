library("tseries")
library("PortfolioAnalytics")
library("quantmod")
library("Quandl")
library("DEoptim")

#**********************"Indian Stock Market analysis"*******************************************
#Banking sector stocks analysis


#SBI

getSymbols('SBIN.NS', src='yahoo', from="2007-01-01", to="2022-01-01")
sbi = SBIN.NS[,6] #here we are taking adjusted price
#columns: [open, high, low, close, volume, adjusted]
msbi=monthlyReturn(sbi,type='arithmetic')
colnames(msbi) = "msbi"
table.AnnualizedReturns(msbi)
charts.PerformanceSummary(msbi)

#HDFC

getSymbols('HDFCBANK.BO', src='yahoo', from="2007-01-01", to="2022-01-01")
hdfc = HDFCBANK.BO[,6] #here we are taking adjusted price\
mhdfc=monthlyReturn(hdfc,type='arithmetic')
colnames(mhdfc) = "mhdfcl"
table.AnnualizedReturns(mhdfc)
charts.PerformanceSummary(mhdfc)

#ICICI

getSymbols('ICICIBANK.BO', src='yahoo', from="2007-01-01", to="2022-01-01")
icici = ICICIBANK.BO[,6] #here we are taking adjusted price\
micici=monthlyReturn(icici,type='arithmetic')
colnames(micici) = "micici"
table.AnnualizedReturns(micici)
charts.PerformanceSummary(micici)

#IDFC

getSymbols('IDFC.NS', src='yahoo', from="2007-01-01", to="2022-01-01")
idfc = IDFC.NS[,6] #here we are taking adjusted price\
midfc=monthlyReturn(idfc,type='arithmetic')
colnames(midfc) = "midfc"
table.AnnualizedReturns(midfc)
charts.PerformanceSummary(midfc)

#Axis 

getSymbols('AXISBANK.BO', src='yahoo', from="2007-01-01", to="2022-01-01")
axisb = AXISBANK.BO[,6] #here we are taking adjusted price\
maxis=monthlyReturn(axisb,type='arithmetic')
colnames(maxis) = "maxis"
table.AnnualizedReturns(maxis)
charts.PerformanceSummary(maxis)

#all bank comparison
mbanks = cbind(msbi, mhdfc, midfc, micici, maxis)
table.AnnualizedReturns(mbanks)
charts.PerformanceSummary(mbanks)

#so, from the result we can say that HDFC share performs better as compare to SBI and IDFC bank in terms of risk
#as well as returns(higher sharpe ratio).
