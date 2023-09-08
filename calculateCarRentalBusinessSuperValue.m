function SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness, numOfOperationYears)
% This function calculates the car rental business supervalue given that the
% buyer operates the business for 2 years
SuperValues = struct;
totalSuperValue = 0;

CarRentalBusinessSuperValue = CarRentalBusiness;
CarRentalBusinessSuperValue.cash = 0;
CarRentalBusinessSuperValue = rmfield(CarRentalBusinessSuperValue,"History");
CarRentalBusinessSuperValue.History.numOfPlansExecuted = 0;
for iYear = 1 : numOfOperationYears
    CarRentalBusinessSuperValue = OperateCarRentalBusiness(CarRentalBusinessSuperValue);
    SuperValues.OperationSuperValue = CarRentalBusinessSuperValue.cash;

end
totalSuperValue = totalSuperValue + CarRentalBusinessSuperValue.cash;

carIdentities = CarRentalBusinessSuperValue.carIdentities;
numOfCars = length(carIdentities);
for iCar =  1 : numOfCars
   	CarRentalBusinessSuperValue.cash = 0;
    CarRentalBusinessSuperValue = despenseCar(CarRentalBusinessSuperValue, carIdentities(iCar));
    SuperValues.(strcat(carIdentities(iCar),"SuperValue")) = CarRentalBusinessSuperValue.cash;
    totalSuperValue = totalSuperValue + CarRentalBusinessSuperValue.cash;
    
end

SuperValues.totalSuperValue = totalSuperValue;
