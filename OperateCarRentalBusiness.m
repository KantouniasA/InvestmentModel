function CarRentalBusinessNextYear = OperateCarRentalBusiness(CarRentalBusiness)
% This function estimates the state of the car business after of one year of operation
CarRentalBusinessNextYear = struct;

% Load the car rental business data
carIdentities   = CarRentalBusiness.carIdentities;
cash            = CarRentalBusiness.cash;
currentDate     = CarRentalBusiness.currentDate;
age             = CarRentalBusiness.age;

%% Calculate car operation data
numOfCars       = length(carIdentities);
cashOperation   = 0;

for iCar = 1 : numOfCars
    
    
    % Load the car
    Car     = CarRentalBusiness.(carIdentities(iCar));
    
    % Generate the data of the car
    CarData = generateCarData(Car);
    
    % Calculate the operation data of the car
    CarOperation = calculateCarOperation(CarData);
    
    % Calculate business cash
    cashOperation = CarOperation.cash + cashOperation;
    
end
cash = cash + cashOperation;

%% Assign data to car rental business of the next year

% Car rental business of the next year
CarRentalBusinessNextYear.currentDate       = currentDate + 1;
CarRentalBusinessNextYear.age             	= age + 1;
CarRentalBusinessNextYear.carIdentities     = carIdentities;
for iCar = 1 : numOfCars
    Car                                                                         = CarRentalBusiness.(carIdentities(iCar));
    Car.age                                                                     = Car.age + 1;
    Car.dateCurrent                                                             = currentDate + 1;
    CarRentalBusinessNextYear.(Car.id)                                          = Car;
end
CarRentalBusinessNextYear.cash              = cash;

% Car rental plan execution
    
    % Car rental business before plan execution
PlanExecution.CarRentalBusiness.currentDate     = CarRentalBusiness.currentDate;
PlanExecution.CarRentalBusiness.age             = CarRentalBusiness.age;
PlanExecution.CarRentalBusiness.carIdentities   = CarRentalBusiness.carIdentities;
for iCar = 1 : numOfCars
    PlanExecution.CarRentalBusiness.(carIdentities(iCar)) = CarRentalBusiness.(carIdentities(iCar));
end
PlanExecution.CarRentalBusiness.cash            = CarRentalBusiness.cash;

    % Plan execution information
PlanExecution.type                                           	= "BusinessOperation";
for iCar = 1 : numOfCars
    PlanExecution.(strcat(carIdentities(iCar),"Data"))          = CarData;
    PlanExecution.(strcat(carIdentities(iCar),"Operation"))     = CarOperation;
end

PlanExecution.cash                             = cashOperation;

% Car rentla history
numOfPlansExecutedNew                                                           = CarRentalBusiness.History(1).numOfPlansExecuted + 1;
CarRentalBusinessNextYear.History                                            	= CarRentalBusiness.History;
CarRentalBusinessNextYear.History(1).numOfPlansExecuted                         = numOfPlansExecutedNew;
CarRentalBusinessNextYear.History(numOfPlansExecutedNew).PlanExecution          = PlanExecution;

