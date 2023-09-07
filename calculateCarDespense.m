function [CarDespense]= calculateCarDespense(CarData)
% calculateCarDespense is a function that calculates all the incomes from a car purchase

% Load the data needed for the purchase income calculation
valueInitial                        = CarData.valueInitial;
valueDegradationCoeficientAge       = CarData.valueDegradationCoeficientAge;
valueDegradationCoeficientRelease   = CarData.valueDegradationCoeficientRelease;

taxCarDespense                      = CarData.taxCarDespense;

% Car dealing calculation
valueFinal      = valueInitial * (1 - valueDegradationCoeficientAge - valueDegradationCoeficientRelease);

CarDespenseIncome     	= valueFinal;
CarDespenseTax    = CarDespenseIncome * taxCarDespense;

% Assign data to car despense structure
CarDespense.Income    	= CarDespenseIncome;
CarDespense.Tax         = CarDespenseTax;