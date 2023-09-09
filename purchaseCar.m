function CarRentalBusinessNew = purchaseCar(CarRentalBusiness, Car)
% This function calculates the car rental business state after the purchase of a car

% Generate the data of the car
CarData = generateCarData(Car);

% Calculate the car purchase
CarPurchase = calculateCarPurchase(CarData);
cashPurchase = - CarPurchase.Cost + CarPurchase.TaxReturn;

% Update the car rental business
CarRentalBusinessNew.currentDate        = CarRentalBusiness.currentDate;
CarRentalBusinessNew.age                = CarRentalBusiness.age;
CarRentalBusinessNew.carIdentities      = [CarRentalBusiness.carIdentities; Car.id];

carIdentities = CarRentalBusiness.carIdentities;
numOfCars = length(carIdentities);
for iCar = 1 : numOfCars
    carIdentity                         = CarRentalBusiness.carIdentities(iCar);
    CarRentalBusinessNew.(carIdentity)  = CarRentalBusiness.(carIdentity);
end

CarRentalBusinessNew.(Car.id)   = Car;
CarRentalBusinessNew.cash       = CarRentalBusiness.cash + cashPurchase;

% Car rental plan execution
PlanExecution.CarRentalBusiness.currentDate     = CarRentalBusiness.currentDate;
PlanExecution.CarRentalBusiness.age             = CarRentalBusiness.age;
PlanExecution.CarRentalBusiness.carIdentities   = CarRentalBusiness.carIdentities;
for iCar = 1 : numOfCars
    PlanExecution.CarRentalBusiness.(carIdentities(iCar)) = CarRentalBusiness.(carIdentities(iCar));
end
PlanExecution.CarRentalBusiness.cash            = CarRentalBusiness.cash;

PlanExecution.type                          = "BusinessPurchase";
PlanExecution.(strcat(Car.id, "Data"))      = CarData; 
PlanExecution.(strcat(Car.id, "Purchase"))  = CarPurchase;
PlanExecution.cash                          = cashPurchase;

% Car rental history
numOfPlansExecutedNew                                               = CarRentalBusiness.History(1).numOfPlansExecuted + 1;
CarRentalBusinessNew.History                                        = CarRentalBusiness.History;
CarRentalBusinessNew.History(1).numOfPlansExecuted                  = numOfPlansExecutedNew;
CarRentalBusinessNew.History(numOfPlansExecutedNew).PlanExecution	= PlanExecution;
CarRentalBusinessNew.HistoryAge                                  	= CarRentalBusiness.HistoryAge;
