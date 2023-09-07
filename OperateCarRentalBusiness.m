function [CarRentalBusinessNextYear, CarRentalBusinessOperationData] = OperateCarRentalBusiness(CarRentalBusiness)
% This function estimates the state of the car business after of one year of operation
CarRentalBusinessNextYear = struct;

% Load the car rental business data
carIdentities   = CarRentalBusiness.carIdentities;
cash            = CarRentalBusiness.cash;
currentDate     = CarRentalBusiness.currentDate;

% Simple calculations
numOfCars       = length(carIdentities);
nextYearDate    = currentDate + 1;

% Estimate the income, cost, tax, tax return and car state after one year of usage

for iCar = 1 : numOfCars
    
    %% Calculate car operation data
    % Load the car
    Car     = CarRentalBusiness.(carIdentities(iCar));
    
    % Generate the data of the car
    CarData = generateCarData(Car);
    
    % Calculate the operation data of the car
    CarOperation = calculateCarOperation(CarData);
    
    % Calculate business cash
    cash = cash + CarOperation.Income - CarOperation.Tax - CarOperation.Cost + CarOperation.TaxReturn;
    
    % Assign data
    Car.age                                             = Car.age + 1;
    Car.dateCurrent                                     = nextYearDate;
    CarRentalBusinessNextYear.(carIdentities(iCar))     = Car;
    CarRentalBusinessOperationData.(strcat(carIdentities(iCar),"Data"))         = CarData;
    CarRentalBusinessOperationData.(strcat(carIdentities(iCar),"Operation"))    = CarOperation;
    
end

%% Car rental business of the next year
CarRentalBusinessNextYear.cash              = cash;
CarRentalBusinessNextYear.currentDate       = nextYearDate;
CarRentalBusinessNextYear.carIdentities     = carIdentities;
