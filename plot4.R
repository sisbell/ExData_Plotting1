# see plotDrawer.R" for function implementations
source("plotDrawer.R")
data <- loadData()
par(mfcol=c(2,2))
drawActivePowerByDay()
drawSubMeteringByDay("n")
drawVoltageByDay()
drawReativePowerByDay()
savePlot("plot4")
