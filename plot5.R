plot5<-function(){
  #FUNCTION TO PLOT TOTAL EMISSION BY Baltimore City, Maryland TO SEE WHETHER TOTAL EMISSIONS HAVE INCREASED/DECREASED FROM 1999-2008  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")  
  
  
  #GET THE VECHICLE SUBSET FROM THE NEI DATA
  NEI_VECHICLES <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  VEHICLES_SCC <- SCC[NEI_VECHICLES,]$SCC
  VEHICLES_NEI <- NEI[NEI$SCC %in% VEHICLES_SCC,]
  
  #GET BALTIMORE NEI VEHICLE DATA
  baltimore_NEI_VEHICLE <- VEHICLES_NEI[VEHICLES_NEI$fips=="24510",]
  
  #TO SAVE INTO PNG FILE
  png("plot5.png",units="px",bg="transparent",width=450,height=450)
  
  #LOAD GGPLOT2 LIBRARY
  library(ggplot2)

  #GENERATE GGPLOT CHART
  BALTIMORE_NEI_VEHICLE_PLOT <- ggplot(baltimore_NEI_VEHICLE,aes(factor(year),Emissions)) +
  labs(x="Observation years", y="Total PM2.5 Emission") + 
  labs(title="Baltimore PM2.5 Motor Vehicle Source Emissions from 1999 till 2008") +
  geom_bar(stat="identity",fill="green",width=0.9) +
  guides(fill=FALSE) 

  print(BALTIMORE_NEI_VEHICLE_PLOT)
  
  dev.off()
  
}