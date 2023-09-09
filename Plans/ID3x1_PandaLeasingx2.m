%% Plan ID3 purchase plan
CarRentalBusiness = GenerateCarRentalBusiness;

% Operate the car rental business for one year
CarRentalBusiness.cash = 30000-(41500-30000);
CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);

% Buy an ID3 (car4)
Car4 = struct;
Car4.model          = "ID3";
Car4.type           = "eV";
Car4.age            = 0;
Car4.dateRelease    = CarRentalBusiness.currentDate;
Car4.dateCurrent    = CarRentalBusiness.currentDate;
Car4.id             = "Car4";

% Buy an PandaLeasing (car5)
Car5 = struct;
Car5.model          = "PandaLeasing";
Car5.type           = "conventional";
Car5.age            = 0;
Car5.dateRelease    = CarRentalBusiness.currentDate;
Car5.dateCurrent    = CarRentalBusiness.currentDate;
Car5.id             = "Car5";

% Buy an PandaLeasing (car6)
Car6 = struct;
Car6.model          = "PandaLeasing";
Car6.type           = "conventional";
Car6.age            = 0;
Car6.dateRelease    = CarRentalBusiness.currentDate;
Car6.dateCurrent    = CarRentalBusiness.currentDate;
Car6.id             = "Car6";

CarRentalBusiness = purchaseCar(CarRentalBusiness,Car4);
CarRentalBusiness = purchaseCar(CarRentalBusiness,Car5);
CarRentalBusiness = purchaseCar(CarRentalBusiness,Car6);

% Operate the car rental business for one year
numOfOperationYears = 4;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

% Calculate business super value
numOfSuperValueYears = 0;
SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness, numOfSuperValueYears);