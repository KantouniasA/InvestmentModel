close all

% PlotPlanResults

planName = ["ID3x1_PandaLeasingx2"];
        
legendNames = ["ID3x1+PandaLeasingx2"];


numOfPlans = length(planName);
figure(1)
for iPlan = 1 : numOfPlans

run(planName(iPlan))

numOfYears = length(CarRentalBusiness.HistoryAge);
carRentalBusinessCash           = zeros(1,numOfYears);
carRentalBusinessEquipmentValue = zeros(1,numOfYears);
carRentalBusinessYears          = zeros(1,numOfYears);

for iYear = 1 : numOfYears
    
    % Calculate business cash
    carRentalBusinessCash(iYear) = CarRentalBusiness.HistoryAge(iYear).CarRentalBusiness.cash;
    
    % Calculate business super value
    numOfSuperValueYears = 0;
    SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness.HistoryAge(iYear).CarRentalBusiness, numOfSuperValueYears);
    carRentalBusinessEquipmentValue(iYear) = SuperValues.totalSuperValue;
    
    % Calculate business year
    carRentalBusinessYears(iYear) = CarRentalBusiness.HistoryAge(iYear).CarRentalBusiness.currentDate;
end

hold on
plot(carRentalBusinessYears, carRentalBusinessCash, 'LineWidth', 2)

end
xlabel("Year")
ylabel("Cash [euro]")
legend(legendNames)

figure(2)
for iPlan = 1 : numOfPlans

run(planName(iPlan))

numOfYears = length(CarRentalBusiness.HistoryAge);
carRentalBusinessCash           = zeros(1,numOfYears);
carRentalBusinessEquipmentValue = zeros(1,numOfYears);
carRentalBusinessYears          = zeros(1,numOfYears);

for iYear = 1 : numOfYears
    
    % Calculate business cash
    carRentalBusinessCash(iYear) = CarRentalBusiness.HistoryAge(iYear).CarRentalBusiness.cash;
    
    % Calculate business super value
    numOfSuperValueYears = 0;
    SuperValues = calculateCarRentalBusinessSuperValue(CarRentalBusiness.HistoryAge(iYear).CarRentalBusiness, numOfSuperValueYears);
    carRentalBusinessEquipmentValue(iYear) = SuperValues.totalSuperValue;
    
    % Calculate business year
    carRentalBusinessYears(iYear) = CarRentalBusiness.HistoryAge(iYear).CarRentalBusiness.currentDate;
end

hold on
plot(carRentalBusinessYears, carRentalBusinessEquipmentValue, 'LineWidth', 2)

end
xlabel("Year")
ylabel("Equipment Value [euro]")
legend(legendNames)
        
