function [CarPurchase]= calculateCarPurchase(CarData)
% calculateCarPurchase is a function that calculates all the incomes from a car purchase

% Load the data needed for the purchase income calculation
valueInitial                        = CarData.valueInitial;
valueDegradationCoeficientAge       = CarData.valueDegradationCoeficientAge;
valueDegradationCoeficientRelease   = CarData.valueDegradationCoeficientRelease;

discountFactorEAstypalea            = CarData.discountFactorEAstypalea;
discountManufacturer                = CarData.discountManufacturer;

taxCarPurchase                      = CarData.taxCarPurchase;

% Car dealing calculation
valueFinal      = valueInitial * (1 - valueDegradationCoeficientAge - valueDegradationCoeficientRelease);

CarPurchaseCost         = valueFinal * discountFactorEAstypalea - discountManufacturer;
CarPurchaseTaxReturn    = CarPurchaseCost * taxCarPurchase;

% Assign data to car purchase structure
CarPurchase.Cost        = CarPurchaseCost;
CarPurchase.TaxReturn 	= CarPurchaseTaxReturn;
