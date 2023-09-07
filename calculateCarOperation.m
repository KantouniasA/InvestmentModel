function [CarOperation]= calculateCarOperation(CarData)
% calculateCarIncome is a function that calculates all the incomes from a car

% Load the data needed for the income calculation
incomeInitial                       = CarData.incomeInitial;
incomeDegradationCoeficientAge      = CarData.incomeDegradationCoeficientAge;
incomeDegradationCoeficientRelease  = CarData.incomeDegradationCoeficientRelease;
incomeDegradationCoeficientDemand   = CarData.incomeDegradationCoeficientDemand;
taxRental                           = CarData.taxRental;

damageSmallPropability              = CarData.damageSmallPropability;
damageSmallSeasonLoss              	= CarData.damageSmallSeasonLoss;
damageBigPropability                = CarData.damageBigPropability;
damageBigSeasonLoss              	= CarData.damageBigSeasonLoss;

operationDays                      	= CarData.operationDays;
costInsurance                       = CarData.costInsurance;
costCleaning                        = CarData.costCleaning;
costMaintenance                     = CarData.costMaintenance;
taxInsurance                        = CarData.taxInsurance;
taxMaintenance                      = CarData.taxMaintenance;
taxCleaning                         = CarData.taxCleaning;
% Car operation income calculation
incomeFinal             = incomeInitial*(1 - incomeDegradationCoeficientAge - incomeDegradationCoeficientRelease)*incomeDegradationCoeficientDemand;
carOperationIncome      = incomeFinal*(1 - damageSmallPropability*damageSmallSeasonLoss - damageBigPropability*damageBigSeasonLoss);
carOperationTax         = carOperationIncome * taxRental;

% Car operation costs calculation
costCleaningYear        = costCleaning*operationDays;
carOperationCost        = costInsurance + costCleaningYear + costMaintenance;
carOperationTaxReturn   = costInsurance*taxInsurance + costCleaningYear*taxCleaning + costMaintenance*taxMaintenance;

% Assign data to car operation structure
CarOperation.Income     = carOperationIncome;
CarOperation.Tax        = carOperationTax;
CarOperation.Cost       = carOperationCost;
CarOperation.TaxReturn  = carOperationTaxReturn;
