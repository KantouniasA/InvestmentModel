%% Plan no purchase plan
CarRentalBusiness = GenerateCarRentalBusiness;
CarRentalBusiness.cash = 30000-(41500-30000);

% Operate the car rental business for one year
CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);


% Operate the car rental business for one year
numOfOperationYears = 4;
for iOpeartionYear  = 1 : numOfOperationYears
    CarRentalBusiness = OperateCarRentalBusiness(CarRentalBusiness);
end

% Calculate business super value
numOfSuperValueYears = 0;
SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness, numOfSuperValueYears);