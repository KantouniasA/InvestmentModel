%% Plan panda leasing plan
CarRentalBusiness = GenerateCarRentalBusiness;

% Operate the car rental business for one year
CarRentalBusiness.cash = 30000-(41500-30000);
CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);

% Buy an PandaLeasing (car4)
Car4 = struct;
Car4.model          = "PandaLeasing";
Car4.type           = "conventional";
Car4.age            = 0;
Car4.dateRelease    = CarRentalBusiness.currentDate;
Car4.dateCurrent    = CarRentalBusiness.currentDate;
Car4.id             = "Car4";

CarRentalBusiness = purchaseCar(CarRentalBusiness,Car4);

% Operate the car rental business for one year
numOfOperationYears = 4;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

% Calculate business super value
numOfSuperValueYears = 0;
SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness, numOfSuperValueYears);