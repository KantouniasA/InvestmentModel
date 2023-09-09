%% Plan ID3 purchase plan
CarRentalBusiness = GenerateCarRentalBusiness;

% Operate the car rental business for one year
CarRentalBusiness.cash = 30000-(41500-30000);
CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);


% Buy an ID3 (car4)
Car4 = struct;
Car4.model          = "PandaLeasing";
Car4.type           = "conventional";
Car4.age            = 0;
Car4.dateRelease    = CarRentalBusiness.currentDate;
Car4.dateCurrent    = CarRentalBusiness.currentDate;
Car4.id             = "Car4";

% Buy an ID3 (car5)
Car5 = struct;
Car5.model          = "PandaLeasing";
Car5.type           = "conventional";
Car5.age            = 0;
Car5.dateRelease    = CarRentalBusiness.currentDate;
Car5.dateCurrent    = CarRentalBusiness.currentDate;
Car5.id             = "Car5";

CarRentalBusiness = purchaseCar(CarRentalBusiness,Car4);
CarRentalBusiness = purchaseCar(CarRentalBusiness,Car5);

% Operate the car rental business for one year
numOfOperationYears = 4;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

% Calculate business super value
numOfSuperValueYears = 0;
SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness, numOfSuperValueYears);