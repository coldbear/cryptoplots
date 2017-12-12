# plot of CRIX

#libraries
require(jsonlite)
require(zoo)

#loading and formatiingdata
json_file = "http://crix.hu-berlin.de/data/crix.json"
crix = fromJSON(json_file)
crix$date = as.Date(crix$date)

#plotting
plot(crix, type = "l", col = "blue3", lwd = 3, xlab = "Date", ylab = "Performance of CRIX")

# volatility of logreturns of CRIX (monthly aggregated standard deviation)

#getting returns
ret.table = data.frame(date = crix$date[-1], returns = diff(log(crix$price)))
ret.table$MY = as.yearmon(ret.table$date, "%y-%m")
aggr.month.returns = aggregate(returns ~ MY, ret.table, sd)

#plotting
plot(aggr.month.returns, type = "l", col = "red", lwd = 3, xlab = "Date", ylab = "Monthly aggregated returns volatility")
