plot4<-function(){
  #FUNCTION TO PLOT TOTAL EMISSION BY Baltimore City, Maryland TO SEE WHETHER TOTAL EMISSIONS HAVE INCREASED/DECREASED FROM 1999-2008  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")  
  
  #FIND COMBUSTION RELATED SUBSET FROM THE TOTAL NEI DATA
  RELATED_COMBUSTION_SCC <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
  RELATED_COAL_SCC <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
  COAL_COMBUSTION_GROUPING <- (RELATED_COMBUSTION_SCC & RELATED_COAL_SCC)
  COAL_COMBUSTION_SCC<- SCC[COAL_COMBUSTION_GROUPING,]$SCC
  COAL_COMBUSTION_NEI <- NEI[NEI$SCC %in% COAL_COMBUSTION_SCC,]

  #TO SAVE INTO PNG FILE  
  png("plot4.png",units="px",bg="transparent",width=450,height=450)
  
  #LOAD GGPLOT2 LIBRARY
  library(ggplot2)
  
  #GENERATE GGPLOT CHART
  COAL_COMBUSTION_PLOT <- ggplot(COAL_COMBUSTION_NEI,aes(factor(year),Emissions/10^5)) +
  labs(x="Observation years", y="Total PM2.5 Emission") + 
  labs(title="PM2.5 Coal Combustion Source Emissions Across US from 1999-2008") +
  geom_bar(stat="identity",fill="blue",width=0.9) +
  guides(fill=FALSE)

  print(COAL_COMBUSTION_PLOT)
  
  dev.off() 
  
  
}