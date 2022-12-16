data <- c(
  'E-Tron', 'A7 Sportback S', 'Electric', '2.0 TDI Diesel','402', '201', '5.5', '6.8', '490', '496',
  'i8', '7-Series', 'Petrol/Electric/Hybrid', '725d Diesel', '356', '227', '4.3',  '6.7', '468', '509',
  'Leaf', 'NV200', 'Electric', 'Electric', '147', '107',  '8.3', '13.6','449',  '456')

cars <- array(data, dim=c(2,5,3))
cars
dimnames(cars)[[2]]<-c('Model','Engine','Power','0-60mph','Length')
dimnames(cars)[[3]]<-c('Audi','BMW','Nissan')
cars[,'Model',]
cars[,'Engine','Nissan']
cars[,,'Nissan']
cars2<-array(data=data, dim=c(2,5,3), dimnames=list(NULL,c('Model','Engine','Power','0-60mph','Length'),c('Audi','BMW','Nissan')))
cars2             
#
companies <- c('Expedia','Priceline','American Express')
earnings <- c(50.4,50.3,29.9)
founded <- c(1966,1997,NA)
employees <- c(22.6,24.5,12)
travel_info <- list(companies, earnings, founded, employees)
travel_info
typeof(travel_info)
travel_info[2]
typeof(travel_info[2])
travel_info[3]
typeof(travel_info[3])
names(travel_info)<-c('companies','earnings','founded','employees')
travel_info
typeof(travel_info['employees'])
typeof(travel_info[['employees']])
typeof(travel_info$employees)
travel_info[['earnings']]/travel_info[['employees']]
