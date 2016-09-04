plot2<-function(){
  #FUNCTION TO PLOT TOTAL EMISSION BY Baltimore City, Maryland TO SEE WHETHER TOTAL EMISSIONS HAVE INCREASED/DECREASED FROM 1999-2008  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")  
  
  #SUBSET NET FOR BALTIMORE LOCATION WHERE FLIP=24510
  baltimore_NEI <- NEI[NEI$fips=="24510",]
  
  #GET TOTAL EMISSIONS BY EACH YEAR FOR Baltimore City
  NEI_SUM_BY_YEAR<- aggregate(Emissions~year,data = baltimore_NEI,FUN = sum)
  
  png("plot2.png",units="px",bg="transparent",width=450,height=450)
  
  barplot(height=NEI_SUM_BY_YEAR$Emissions, 
          names.arg=NEI_SUM_BY_YEAR$year, 
          xlab="Emission Years", 
          ylab=expression('Total PM2.5 Emission'),
          main=expression('Total PM2.5 Emissions FOR BALTIMORE CITY, MARYLAND FROM YEAR 1999-2008 '))
  
  #SEND THE IMAGE TO plot1.png
  dev.off()
  
  #Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
  #from 1999 to 2008? Use the base plotting system to make a plot answering this question.
  #ANSWER: YES IT HAS DECREASED FOR BALTIMORE CITY
  
  
}