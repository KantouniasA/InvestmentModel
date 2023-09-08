function [CarDespense]= calculateCarDespense(CarData)
% calculateCarDespense is a function that calculates all the incomes from a car purchase

% Load the data needed for the purchase income calculation
valueInitial                        = CarData.valueInitial;
valueDegradationCoeficientAge       = CarData.valueDegradationCoeficientAge;
valueDegradationCoeficientRelease   = CarData.valueDegradationCoeficientRelease;

taxCarDespense                      = CarData.taxCarDespense;

% Car dealing calculation
if CarData.discountFactorEAstypalea == 1 && CarData.carAge >= 3
    valueFinal      = valueInitial * (1 - valueDegradationCoeficientAge - valueDegradationCoeficientRelease);
else
    valueFinal = 0;
end

CarDespenseIncome     	= valueFinal;
CarDespenseTax    = CarDespenseIncome * taxCarDespense;

% Assign data to car despense structure
CarDespense.Income    	= CarDespenseIncome;
CarDespense.Tax         = CarDespenseTax;