clear all
%% Plan no purchase plan
CarRentalBusiness = GenerateCarRentalBusiness;

% Operate the car rental business for one year
CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);

% Operate the car rental business for one year
numOfOperationYears = 2;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

% Calculate business super value
SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness, numOfOperationYears);