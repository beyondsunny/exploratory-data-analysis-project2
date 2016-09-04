plot6<-funtion(){
  #FUNCTION TO PLOT TOTAL EMISSION BY Baltimore City, Maryland TO SEE WHETHER TOTAL EMISSIONS HAVE INCREASED/DECREASED FROM 1999-2008  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")  
  
  #GET THE VECHICLE SUBSET FROM THE NEI DATA
  NEI_VECHICLES <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  VEHICLES_SCC <- SCC[NEI_VECHICLES,]$SCC
  VEHICLES_NEI <- NEI[NEI$SCC %in% VEHICLES_SCC,] 

  #GET BALTIMORE NEI VEHICLE DATA
  baltimore_NEI_VEHICLE <- VEHICLES_NEI[VEHICLES_NEI$fips=="24510",]  
  baltimore_NEI_VEHICLE$city <- "BALTIMORE"
  
  #GET LOS ANGELES NEI VEHICLE DATA
  la_NEI_VEHICLE <- VEHICLES_NEI[VEHICLES_NEI$fips=="06037",]
  la_NEI_VEHICLE$city <- "LOS ANGELES"
  
  #COMBINE ROWS FROM baltimore_NEI_VEHICLE AND la_NEI_VEHICLE
  BALTIMORE_LA_NEI_VEHICLE <- rbind(baltimore_NEI_VEHICLE,la_NEI_VEHICLE) 
  
  #TO SAVE INTO PNG FILE  
  png("plot6.png",width=450,height=450,units="px",bg="transparent")
  
  #LOAD GGPLOT2 LIBRARY  
  library(ggplot2)
  
  gg_plot <- ggplot(BALTIMORE_LA_NEI_VEHICLE, aes(x=factor(year), y=Emissions, fill=city)) +
  labs(x="Observation year", y="Total PM2.5 Emission") + 
  labs(title="PM2.5 Baltimore and Los Angeles Motor Emission from 1999 till 2008") +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE)
  
  print(gg_plot)
  
  dev.off()
  
  #Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
  #vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen 
  #greater changes over time in motor vehicle emissions?
  #ANSWER: BALTIMORE
  
}