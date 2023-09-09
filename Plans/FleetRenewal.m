clear all
%% Plan flee resell
CarRentalBusiness = GenerateCarRentalBusiness;

% Operate the car rental business for one year
CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);

% Buy an ID3 (car4)
Car4 = struct;
Car4.model          = "ID3";
Car4.type           = "eV";
Car4.age            = 0;
Car4.dateRelease    = CarRentalBusiness.currentDate;
Car4.dateCurrent    = CarRentalBusiness.currentDate;
Car4.id             = "Car4";

CarRentalBusiness = purchaseCar(CarRentalBusiness,Car4);

% Operate the car rental business for one year
numOfOperationYears = 2;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

%%
% Sell car 1 
CarRentalBusiness = despenseCar(CarRentalBusiness,"Car1");

% Buy car 5
Car5 = struct;
Car5.model          = "EUp";
Car5.type           = "eV";
Car5.age            = 0;
Car5.dateRelease    = CarRentalBusiness.currentDate;
Car5.dateCurrent    = CarRentalBusiness.currentDate;
Car5.id             = "Car5";

CarRentalBusiness = purchaseCar(CarRentalBusiness,Car5);

% Operate the car rental business for one year
numOfOperationYears = 1;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

%%
% Sell car 2 
CarRentalBusiness = despenseCar(CarRentalBusiness,"Car2");

% Buy car 6
Car6 = struct;
Car6.model          = "EUp";
Car6.type           = "eV";
Car6.age            = 0;
Car6.dateRelease    = CarRentalBusiness.currentDate;
Car6.dateCurrent    = CarRentalBusiness.currentDate;
Car6.id             = "Car6";

CarRentalBusiness = purchaseCar(CarRentalBusiness,Car6);

% Operate the car rental business for one year
numOfOperationYears = 1;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

%%
% Sell car 3 
CarRentalBusiness = despenseCar(CarRentalBusiness,"Car3");

% Buy car 7
Car7 = struct;
Car7.model          = "EUp";
Car7.type           = "eV";
Car7.age            = 0;
Car7.dateRelease    = CarRentalBusiness.currentDate;
Car7.dateCurrent    = CarRentalBusiness.currentDate;
Car7.id             = "Car7";

CarRentalBusiness = purchaseCar(CarRentalBusiness,Car7);

% Operate the car rental business for one year
numOfOperationYears = 1;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

%%
% Operate the car rental business for one year
numOfOperationYears = 2;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

%%
% Calculate business super value
numOfSuperValueYears = 2;
SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness, numOfOperationYears);