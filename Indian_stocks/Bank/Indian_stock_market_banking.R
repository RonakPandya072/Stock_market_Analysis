library("tseries")
library("PortfolioAnalytics")
library("quantmod")
library("Quandl")
library("DEoptim")
library("plotly")


#**********************"Indian Stock Market analysis"*******************************************
#Banking sector stocks analysis


#SBI

getSymbols('SBIN.NS', src='yahoo', from="2007-01-01", to="2022-01-01")

#candlestick_chart
df <- data.frame(Date=index(SBIN.NS),coredata(SBIN.NS))
df <- tail(df, 100)

fig <- df %>% plot_ly(x = ~Date, type="candlestick",
                      open = ~SBIN.NS.Open, close = ~SBIN.NS.Close,
                      high = ~SBIN.NS.High, low = ~SBIN.NS.Low) 
fig <- fig %>% layout(title = "Candlestick Chart SBI",
                      xaxis = list(rangeslider = list(visible = F)))

fig


sbi = SBIN.NS[,6] #here we are taking adjusted price
#columns: [open, high, low, close, volume, adjusted]
msbi=monthlyReturn(sbi,type='arithmetic')
colnames(msbi) = "msbi"
table.AnnualizedReturns(msbi)
charts.PerformanceSummary(msbi)

#HDFC

getSymbols('HDFCBANK.BO', src='yahoo', from="2007-01-01", to="2022-01-01")

#candlestick_chart
df <- data.frame(Date=index(HDFCBANK.BO),coredata(HDFCBANK.BO))
df <- tail(df, 100)

fig <- df %>% plot_ly(x = ~Date, type="candlestick",
                      open = ~HDFCBANK.BO.Open, close = ~HDFCBANK.BO.Close,
                      high = ~HDFCBANK.BO,High, low = ~HDFCBANK.BO.Low) 
fig <- fig %>% layout(title = "Candlestick Chart HDFC",
                      xaxis = list(rangeslider = list(visible = F)))

fig

hdfc = HDFCBANK.BO[,6] #here we are taking adjusted price\
mhdfc=monthlyReturn(hdfc,type='arithmetic')
colnames(mhdfc) = "mhdfcl"
table.AnnualizedReturns(mhdfc)
charts.PerformanceSummary(mhdfc)

#ICICI

getSymbols('ICICIBANK.BO', src='yahoo', from="2007-01-01", to="2022-01-01")

#candlestick_chart
df <- data.frame(Date=index(ICICIBANK.BO),coredata(ICICIBANK.BO))
df <- tail(df, 100)

fig <- df %>% plot_ly(x = ~Date, type="candlestick",
                      open = ~ICICIBANK.BO.Open, close = ~ICICIBANK.BO.Close,
                      high = ~ICICIBANK.BO.High, low = ~ICICIBANK.BO.Low) 
fig <- fig %>% layout(title = "Candlestick Chart ICICI",
                      xaxis = list(rangeslider = list(visible = F)))

fig

icici = ICICIBANK.BO[,6] #here we are taking adjusted price\
micici=monthlyReturn(icici,type='arithmetic')
colnames(micici) = "micici"
table.AnnualizedReturns(micici)
charts.PerformanceSummary(micici)

#IDFC

getSymbols('IDFC.NS', src='yahoo', from="2007-01-01", to="2022-01-01")

#candlestick_chart
df <- data.frame(Date=index(IDFC.NS),coredata(IDFC.NS))
df <- tail(df, 100)

fig <- df %>% plot_ly(x = ~Date, type="candlestick",
                      open = ~IDFC.NS.Open, close = ~IDFC.NS.Close,
                      high = ~IDFC.NS.High, low = ~IDFC.NS.Low) 
fig <- fig %>% layout(title = "Candlestick Chart IDFC",
                      xaxis = list(rangeslider = list(visible = F)))

fig

idfc = IDFC.NS[,6] #here we are taking adjusted price\
midfc=monthlyReturn(idfc,type='arithmetic')
colnames(midfc) = "midfc"
table.AnnualizedReturns(midfc)
charts.PerformanceSummary(midfc)

#Axis 

getSymbols('AXISBANK.BO', src='yahoo', from="2007-01-01", to="2022-01-01")

#candlestick_chart
df <- data.frame(Date=index(AXISBANK.BO),coredata(AXISBANK.BO))
df <- tail(df, 100)

fig <- df %>% plot_ly(x = ~Date, type="candlestick",
                      open = ~AXISBANK.BO.Open, close = ~AXISBANK.BO.Close,
                      high = ~AXISBANK.BO.High, low = ~AXISBANK.BO.Low) 
fig <- fig %>% layout(title = "Candlestick Chart Axis",
                      xaxis = list(rangeslider = list(visible = F)))

fig

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
