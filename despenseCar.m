function CarRentalBusinessNew = despenseCar(CarRentalBusiness, carIdentity)
% This function calculates the car rental business state after the despense of a car

% Load the specific car
Car     = CarRentalBusiness.(carIdentity);

% Generate the data of the car
CarData = generateCarData(Car);

% Calculate the car despense
CarDespense = calculateCarDespense(CarData);
cashDespense = CarDespense.Income - CarDespense.Tax;

% Update the car rental business
CarRentalBusinessNew.currentDate        = CarRentalBusiness.currentDate;
CarRentalBusinessNew.age                = CarRentalBusiness.age;
carIdentitiesNew = strings(0,1);
carIdentitiesNewSize = 0;
for iCarIdentity = 1 : length(CarRentalBusiness.carIdentities)
    if ~strcmp(CarRentalBusiness.carIdentities(iCarIdentity),carIdentity)
        carIdentitiesNewSize = carIdentitiesNewSize + 1;
        carIdentitiesNew(carIdentitiesNewSize) = CarRentalBusiness.carIdentities(iCarIdentity);
    end
end
CarRentalBusinessNew.carIdentities = carIdentitiesNew;

if isempty(carIdentitiesNew)
    % Do nothing
else
    numOfCarsNew = length(carIdentitiesNew);
    for iCar = 1 : numOfCarsNew
        carIdentity                         = carIdentitiesNew(iCar);
        
        CarRentalBusinessNew.(carIdentity)  = CarRentalBusiness.(carIdentity);
    end
    
end
CarRentalBusinessNew.cash       = CarRentalBusiness.cash + cashDespense;

% Car rental plan execution
PlanExecution.CarRentalBusiness.currentDate     = CarRentalBusiness.currentDate;
PlanExecution.CarRentalBusiness.age             = CarRentalBusiness.age;
PlanExecution.CarRentalBusiness.carIdentities   = CarRentalBusiness.carIdentities;

carIdentities = CarRentalBusiness.carIdentities;
numOfCars = length(carIdentities);
for iCar = 1 : numOfCars
    PlanExecution.CarRentalBusiness.(carIdentities(iCar)) = CarRentalBusiness.(carIdentities(iCar));
end
PlanExecution.CarRentalBusiness.cash            = CarRentalBusiness.cash;

PlanExecution.type                          = "BusinessDespense";
PlanExecution.(strcat(Car.id, "Data"))      = CarData; 
PlanExecution.(strcat(Car.id, "Despense"))  = CarDespense;
PlanExecution.cash                          = cashDespense;

% Car rental history
numOfPlansExecutedNew                                               = CarRentalBusiness.History(1).numOfPlansExecuted + 1;
CarRentalBusinessNew.History                                        = CarRentalBusiness.History;
CarRentalBusinessNew.History(1).numOfPlansExecuted                  = numOfPlansExecutedNew;
CarRentalBusinessNew.History(numOfPlansExecutedNew).PlanExecution	= PlanExecution;
