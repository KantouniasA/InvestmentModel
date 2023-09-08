function CarData = generateCarData(Car)
% generateCarData: This funnction generates all the car data needed for car investment
% efficiency calculation.

% Load car characteristics
carModel        = Car.model;
carType         = Car.type;
carAge          = Car.age;
carDateRelease 	= Car.dateRelease;
carDateCurrent  = Car.dateCurrent;

%% Discounts calculations

% Calculate eAstypalea discount factor
if carDateCurrent <= 2025 && strcmp(carType, "eV")
    discountFactorEAstypalea = 0.61; % [euro / initial value]
else
    discountFactorEAstypalea = 1;
end

% Calculate manufacturer discount
if strcmp(carModel, "EUp") && carAge == 0 && carDateCurrent <= 2025
    discountManufacturer    =  8*1e3; % [euro / initial value]
elseif strcmp(carModel, "ID3") && carAge == 0 && carDateCurrent <= 2025
    discountManufacturer    =  13*1e3; % [euro / initial value]
else
    discountManufacturer    =   0;
end

%% Car value calculations

% Calculate car initia value
if strcmp(carModel,"EUp")
    valueInitial = 22*1e3; % [euro]
elseif strcmp(carModel, "ID3")
    valueInitial = 38*1e3; % [euro]
end

% Calculate value degradation due to age
if strcmp(carModel,"EUp")
    degradationAgesValue             = [0,   2,      4,      7,      12]; % [Years]
    degradationAgeFactorsValue       = [0,   0.02,    0.01,   0.01,   0.01]; % [euro / Years / Initial Value]
elseif strcmp(carModel,"ID3")
    degradationAgesValue         	= [0,   2,      4,      7,      12]; % [Years]
    degradationAgeFactorsValue    	= [0,   0.02,    0.01,   0.01,   0.01]; % [euro / Years / Initial Value]
end
numOfDegradationStages  = length(degradationAgesValue);

valueDegradationCoeficientAge = 0;
for iDegradationStage = 1 : numOfDegradationStages-1
    if carAge >= degradationAgesValue(iDegradationStage + 1)
        valueDegradationCoeficientAge = valueDegradationCoeficientAge + (degradationAgesValue(iDegradationStage+1)- degradationAgesValue(iDegradationStage)) * degradationAgeFactorsValue(iDegradationStage+1);
    else
        valueDegradationCoeficientAge = valueDegradationCoeficientAge + (carAge - degradationAgesValue(iDegradationStage)) * degradationAgeFactorsValue(iDegradationStage+1); % [euro / Initial Value]
        break
    end
end

% Calculate value degradation due to release date
carRelease = carDateCurrent - carDateRelease;

if strcmp(carModel,"EUp")
    degradationReleaseValue       	= [0,   2,      4,      7,      12]; % [Years]
    degradationReleaseFactorsValue 	= [0,   0.1,    0.05,   0.07,   0.02]; % [euro / Years / Initial Value]
elseif strcmp(carModel,"ID3")
    degradationReleaseValue      	= [0,   2,      4,      7,      12]; % [Years]
    degradationReleaseFactorsValue 	= [0,   0.1,    0.05,   0.07,   0.02]; % [euro / Years / Initial Value]
end
numOfDegradationStages  = length(degradationReleaseValue);

valueDegradationCoeficientRelease = 0;
for iDegradationStage = 1 : numOfDegradationStages-1
    if carRelease >= degradationReleaseValue(iDegradationStage + 1)
        valueDegradationCoeficientRelease = valueDegradationCoeficientRelease + (degradationReleaseValue(iDegradationStage+1)- degradationReleaseValue(iDegradationStage)) * degradationReleaseFactorsValue(iDegradationStage+1);
    else
        valueDegradationCoeficientRelease = valueDegradationCoeficientRelease + (carRelease - degradationReleaseValue(iDegradationStage)) * degradationReleaseFactorsValue(iDegradationStage+1); % [euro / Initial Value]
        break
    end
end

%% Car usage calculation

% Calculate initial usage income value
if strcmp(carModel,"EUp")
    % 1-20 June day _____ 21-30 June _____ 1-20 July _____ 20 July - 20 August ______ 20 - 30 August ______ 1 - 15 sept___ 15 - 30 Sept
    operationDaysNumber	= [10,   10,    15,   30,   10,     12,     10]; % [Days]
    operationDaysPrice     = [50,   60,    70,   90,   70,     60,     50]; % [euro / Day]
elseif strcmp(carModel,"ID3")
  	% 1-20 June day _____ 21-30 June _____ 1-20 July _____ 20 July - 20 August ______ 20 - 30 August ______ 1 - 15 sept___ 15 - 30 Sept
    operationDaysNumber	= [10,   10,    15,   30,   10,     12,     10]; % [Days]
    operationDaysPrice     = [55,   65,    80,   120, 	80,     65,     55]; % [euro / Day]
end

numOfSellingStages  = length(operationDaysNumber);
incomeInitial       = 0;
for iSellingStage = 1 : numOfSellingStages
    incomeInitial   = incomeInitial + operationDaysNumber(iSellingStage) * operationDaysPrice(iSellingStage);
end
operationDays             = sum(operationDaysNumber);

% Calculate income degradation due to the age of the car
if strcmp(carModel,"EUp")
    degradationAgesIncome             = [0,   2,      4,      7,      12]; % [Years]
    degradationAgeFactorsIncome       = [0,   0.02,    0.01,   0.01,   0.01]; % [euro / Years/ income initial]
elseif strcmp(carModel,"ID3")
    degradationAgesIncome         	= [0,   2,      4,      7,      12]; % [Years]
    degradationAgeFactorsIncome    	= [0,   0.02,    0.01,   0.01,   0.01]; % [euro / Years / income initial]
end
numOfDegradationStages  = length(degradationAgesIncome);

incomeDegradationCoeficientAge = 0;
for iDegradationStage = 1 : numOfDegradationStages-1
    if carAge >= degradationAgesIncome(iDegradationStage + 1)
        incomeDegradationCoeficientAge = incomeDegradationCoeficientAge + (degradationAgesIncome(iDegradationStage+1)- degradationAgesIncome(iDegradationStage)) * degradationAgeFactorsIncome(iDegradationStage+1);
    else
        incomeDegradationCoeficientAge = incomeDegradationCoeficientAge + (carAge - degradationAgesIncome(iDegradationStage)) * degradationAgeFactorsIncome(iDegradationStage+1); % [euro / income initial]
        break
    end
end

% Calculate income degradation due to release date
carRelease = carDateCurrent - carDateRelease;

if strcmp(carModel,"EUp")
    degradationReleaseIncome       	= [0,   2,      4,      7,      12];
    degradationReleaseFactorsIncome 	= [0,   0.1,    0.05,   0.07,   0.02]; % [euro / Years / income intial]
elseif strcmp(carModel,"ID3")
    degradationReleaseIncome      	= [0,   2,      4,      7,      12];
    degradationReleaseFactorsIncome 	= [0,   0.1,    0.05,   0.07,   0.02]; % [euro / Years / income initial]
end
numOfDegradationStages  = length(degradationReleaseIncome);

incomeDegradationCoeficientRelease = 0;
for iDegradationStage = 1 : numOfDegradationStages-1
    if carRelease >= degradationReleaseIncome(iDegradationStage + 1)
        incomeDegradationCoeficientRelease = incomeDegradationCoeficientRelease + (degradationReleaseIncome(iDegradationStage+1)- degradationReleaseIncome(iDegradationStage)) * degradationReleaseFactorsIncome(iDegradationStage+1);
    else
        incomeDegradationCoeficientRelease = incomeDegradationCoeficientRelease + (carRelease - degradationReleaseIncome(iDegradationStage)) * degradationReleaseFactorsIncome(iDegradationStage+1); % [euro / income initial]
        break
    end
end

% Calculate income degradation due to market demand
if strcmp(carModel,"EUp")
    degradationDemandIncome       	= [2023,    2024,   2025,   2026,  2027,    2028,   2040];
    degradationDemandFactorsIncome 	= [1,   	0.9,    0.85,   0.9,   1,       1.1,    1.3]; % [euro / income total]
elseif strcmp(carModel,"ID3")
    degradationDemandIncome       	= [2023,    2024,   2025,   2026,  2027,    2028,   2040];
    degradationDemandFactorsIncome 	= [1,   	0.9,    0.85,   0.9,   1,       1.1,    1.3]; % [eruo / income total]
end

incomeDegradationCoeficientDemand   = interp1(degradationDemandIncome, degradationDemandFactorsIncome, carDateCurrent);

% Calculate cost of insurance
if strcmp(carModel,"EUp")
    costInsurance        = 500; % [euro] 
elseif strcmp(carModel,"ID3")
    costInsurance        = 500; % [euro] 
end

% Calculate cost of cleaning
if strcmp(carModel,"EUp")
    costCleaning        = 0.5; % [euro / rental day] 
elseif strcmp(carModel,"ID3")
    costCleaning        = 0.5; % [euro / rental day] 
end

% Calculate cost of maintenance
if strcmp(carModel,"EUp")
    % KTEO _____ Tire Repair _____ Inspection Service _____ CV Joints _____ Battery element
    costMaintenanceFrequency  	= [1,       2,      2,      4]; % [Age years]
    costMaintenanceData        	= [200,   	280,    125,    45+100]; % [euro]
    
elseif strcmp(carModel,"ID3")
    costMaintenanceFrequency    = [1,       2,       2,      3];
    costMaintenanceData        	= [200,   	360,     180,    45+100]; % [euro]

end

numOfMaintenances = length(costMaintenanceFrequency);
costMaintenance = 0;
for iMaintenance = 1 : numOfMaintenances
    if mod(carAge,costMaintenanceFrequency(iMaintenance)) == 0
    costMaintenance = costMaintenance + costMaintenanceData(iMaintenance);
    end
end

% Calculate damage cost
if strcmp(carModel,"EUp")
    damageSmallPropability      = 5/100;
    damageSmallSeasonLoss       = 0.3;  % [euro / income total]
    damageBigPropability        = 2/100;
    damageBigSeasonLoss         = 1.0; % [euro / income total]
elseif strcmp(carModel,"ID3")
    damageSmallPropability      = 7/100;
    damageSmallSeasonLoss       = 0.3;  % [euro / income total]
    damageBigPropability        = 2/100;
    damageBigSeasonLoss         = 1.0; % [euro / income total]
end

% Calculate tax 
taxCarPurchase      = 0.24;
taxCarDespense      = 0.10;
taxRental           = 0.24;
taxInsurance        = 0.24;            
taxMaintenance      = 0.24;
taxCleaning         = 0.12;

%% Assign results to car data
CarData.discountFactorEAstypalea            = discountFactorEAstypalea;
CarData.discountManufacturer                = discountManufacturer;
CarData.valueInitial                        = valueInitial;
CarData.valueDegradationCoeficientAge       = valueDegradationCoeficientAge;
CarData.valueDegradationCoeficientRelease   = valueDegradationCoeficientRelease;
CarData.incomeInitial                       = incomeInitial;
CarData.incomeDegradationCoeficientAge      = incomeDegradationCoeficientAge;
CarData.incomeDegradationCoeficientRelease  = incomeDegradationCoeficientRelease;
CarData.incomeDegradationCoeficientDemand   = incomeDegradationCoeficientDemand;
CarData.operationDays                    	= operationDays;
CarData.costInsurance                       = costInsurance;
CarData.costCleaning                        = costCleaning;
CarData.costMaintenance                     = costMaintenance;
CarData.damageSmallPropability              = damageSmallPropability;
CarData.damageSmallSeasonLoss               = damageSmallSeasonLoss;
CarData.damageBigPropability                = damageBigPropability;
CarData.damageBigSeasonLoss                 = damageBigSeasonLoss;
CarData.taxCarDespense                      = taxCarDespense;
CarData.taxCarPurchase                      = taxCarPurchase;
CarData.taxRental                           = taxRental;
CarData.taxInsurance                        = taxInsurance;
CarData.taxMaintenance                  	= taxMaintenance;
CarData.taxCleaning                         = taxCleaning;

CarData.carModel        = carModel;
CarData.carType         = carType;
CarData.carAge          = carAge;
CarData.carDateRelease 	= carDateRelease;
CarData.carDateCurrent  = carDateCurrent;
