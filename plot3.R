plot3<-function(){
  #FUNCTION TO PLOT TOTAL EMISSION BY Baltimore City, Maryland TO SEE WHETHER TOTAL EMISSIONS HAVE INCREASED/DECREASED FROM 1999-2008  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")  
  
  #SUBSET NET FOR BALTIMORE LOCATION WHERE FLIP=24510
  baltimore_NEI <- NEI[NEI$fips=="24510",]
  
  #GET TOTAL EMISSIONS BY EACH YEAR FOR Baltimore City
  NEI_SUM_BY_YEAR<- aggregate(Emissions~year,data = baltimore_NEI,FUN = sum)  
  
  #TO SAVE INTO PNG FILE
  png("plot3.png",units="px",bg="transparent",width=450,height=450)
  
  #LOAD GGPLOT2 LIBRARY
  library(ggplot2)
  
  #PLOT THE CHART
  Baltimore_PLOT <- ggplot(baltimore_NEI,aes(factor(year),Emissions,fill=type)) +
  labs(x="Observation years", y=expression("Total P2.5 Emission")) + 
  labs(title="PM2.5 Emissions in Baltimore City From 1999 to 2008 by Source Type") + 
  guides(fill=FALSE)+
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") 

  print(Baltimore_PLOT)
  
  dev.off()
  
  #Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
  #variable, which of these four sources have seen decreases in emissions from 1999-2008 
  #for Baltimore City? Which have seen increases in emissions from 1999-2008? 
  #Use the ggplot2 plotting system to make a plot answer this question.
  #ANSWER: NON-ROAD,NONPOINT,ON-ROAD HAVE SEEN INCREASES, WHILE POINT HAS SEEN DECREASE FROM
  #1999-2000
  
}