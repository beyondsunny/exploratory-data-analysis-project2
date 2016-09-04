plot1<-function(){
  
  #FUNCTION TO PLOT TOTAL EMISSION BY YEAR TO SEE WHETHER TOTAL EMISSIONS HAVE INCREASED/DECREASED FROM 1999-2008  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")  
  
  #GET TOTAL EMISSIONS BY EACH YEAR
  NEI_SUM_BY_YEAR<- aggregate(Emissions~year,data = NEI,FUN = sum)
  
  png("plot1.png",units="px",bg="transparent",width=450,height=450)
  
  barplot(height=NEI_SUM_BY_YEAR$Emissions, 
          names.arg=NEI_SUM_BY_YEAR$year, 
          xlab="Emission Years", 
          ylab=expression('Total PM2.5 Emission'),
          main=expression('Total PM2.5 Emissions From Year 1999-2008 '))
  
  #SEND THE IMAGE TO plot1.png
  dev.off()
  
  #Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
  #Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
  #for each of the years 1999, 2002, 2005, and 2008.
  #ANSWER: YES IT HAS DECREASED 
  
  
}