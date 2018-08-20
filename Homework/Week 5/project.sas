%web_drop_table(WORK.test);
%web_drop_table(WORK.train);
%web_drop_table(results);
%web_drop_table(results2);


FILENAME REFFILE '/home/wtrevino0/MSDS 6371/train.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.train;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.train; RUN;

FILENAME REFFILE '/home/wtrevino0/MSDS 6371/train2.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.train;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.train; RUN;

FILENAME REFFILE '/home/wtrevino0/MSDS 6371/test.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.test;
	GETNAMES=YES;
RUN;
PROC CONTENTS DATA=WORK.test; RUN;


/*
proc print data = test;
run;

proc print data = train;
run;
*/

data test;
set test;
SalePrice = .;
run;

data test;
set test;
GrLivAreaDiv100 = GrLivArea / 100;
if Street = "Grvl" then StreetType = 0;
if Street = "Pave" then StreetType = 1;
if ExterQual = "Po" then ExterQualType = 1;
if ExterQual = "Fa" then ExterQualType = 2;
if ExterQual = "TA" then ExterQualType = 3;
if ExterQual = "Gd" then ExterQualType = 4;
if ExterQual = "Ex" then ExterQualType = 5;
if ExterCond = "Po" then ExterCondType = 1;
if ExterCond = "Fa" then ExterCondType = 2;
if ExterCond = "TA" then ExterCondType = 3;
if ExterCond = "Gd" then ExterCondType = 4;
if ExterCond = "Ex" then ExterCondType = 5;
if BsmtQual = "NA" then BsmtQualType = 0;
if BsmtQual = "Po" then BsmtQualType = 1;
if BsmtQual = "Fa" then BsmtQualType = 2;
if BsmtQual = "TA" then BsmtQualType = 3;
if BsmtQual = "Gd" then BsmtQualType = 4;
if BsmtQual = "Ex" then BsmtQualType = 5;
if BsmtCond = "NA" then BsmtCondType = 0;
if BsmtCond = "Po" then BsmtCondType = 1;
if BsmtCond = "Fa" then BsmtCondType = 2;
if BsmtCond = "TA" then BsmtCondType = 3;
if BsmtCond = "Gd" then BsmtCondType = 4;
if BsmtCond = "Ex" then BsmtCondType = 5;
if HeatingQC = "Po" then HeatingQCType = 1;
if HeatingQC = "Fa" then HeatingQCType = 2;
if HeatingQC = "TA" then HeatingQCType = 3;
if HeatingQC = "Gd" then HeatingQCType = 4;
if HeatingQC = "Ex" then HeatingQCType = 5;
if CentralAir = "N" then CentralAirType = 0;
if CentralAir = "Y" then CentralAirType = 1;
if KitchenQual = "Po" then KitchenQualType = 1;
if KitchenQual = "Fa" then KitchenQualType = 2;
if KitchenQual = "TA" then KitchenQualType = 3;
if KitchenQual = "Gd" then KitchenQualType = 4;
if KitchenQual = "Ex" then KitchenQualType = 5;
if FireplaceQu = "NA" then FireplaceQuType = 0;
if FireplaceQu = "Po" then FireplaceQuType = 1;
if FireplaceQu = "Fa" then FireplaceQuType = 2;
if FireplaceQu = "TA" then FireplaceQuType = 3;
if FireplaceQu = "Gd" then FireplaceQuType = 4;
if FireplaceQu = "Ex" then FireplaceQuType = 5;
if GarageQual = "NA" then GarageQualType = 0;
if GarageQual = "Po" then GarageQualType = 1;
if GarageQual = "Fa" then GarageQualType = 2;
if GarageQual = "TA" then GarageQualType = 3;
if GarageQual = "Gd" then GarageQualType = 4;
if GarageQual = "Ex" then GarageQualType = 5;
if GarageCond = "NA" then GarageCondType = 0;
if GarageCond = "Po" then GarageCondType = 1;
if GarageCond = "Fa" then GarageCondType = 2;
if GarageCond = "TA" then GarageCondType = 3;
if GarageCond = "Gd" then GarageCondType = 4;
if GarageCond = "Ex" then GarageCondType = 5;
if PavedDrive = "Y" then GarageCondType = 1;
if PavedDrive = "P" then GarageCondType = 2;
if PavedDrive = "N" then GarageCondType = 3;
if PoolQC = "NA" then PoolQCType = 0;
if PoolQC = "Po" then PoolQCType = 1;
if PoolQC = "Fa" then PoolQCType = 2;
if PoolQC = "TA" then PoolQCType = 3;
if PoolQC = "Gd" then PoolQCType = 4;
if PoolQC = "Ex" then PoolQCType = 5;
if Neighborhood = "Blmngtn" then Neighborhood_score = 203938;
if Neighborhood = "Blueste" then Neighborhood_score = 146362;
if Neighborhood = "BrDale" then Neighborhood_score = 126504;
if Neighborhood = "BrkSide" then Neighborhood_score = 150711;
if Neighborhood = "ClearCr" then Neighborhood_score = 202657;
if Neighborhood = "CollgCr" then Neighborhood_score = 199969;
if Neighborhood = "Crawfor" then Neighborhood_score = 185677;
if Neighborhood = "Edwards" then Neighborhood_score = 132978;
if Neighborhood = "Gilbert" then Neighborhood_score = 182924;
if Neighborhood = "IDOTRR" then Neighborhood_score = 123725;
if Neighborhood = "MeadowV" then Neighborhood_score = 115044;
if Neighborhood = "Mitchel" then Neighborhood_score = 167737;
if Neighborhood = "NAmes" then Neighborhood_score = 156141;
if Neighborhood = "NoRidge" then Neighborhood_score = 150446;
if Neighborhood = "NPkVill" then Neighborhood_score = 173478;
if Neighborhood = "NridgHt" then Neighborhood_score = 151800;
if Neighborhood = "NWAmes" then Neighborhood_score = 245887;
if Neighborhood = "OldTown" then Neighborhood_score = 129501;
if Neighborhood = "Sawyer" then Neighborhood_score = 130266;
if Neighborhood = "SawyerW" then Neighborhood_score = 146566;
if Neighborhood = "Somerst" then Neighborhood_score = 178029;
if Neighborhood = "StoneBr" then Neighborhood_score = 212623;
if Neighborhood = "SWISU" then Neighborhood_score = 249623;
if Neighborhood = "Timber" then Neighborhood_score = 217426;
if Neighborhood = "Veenker" then Neighborhood_score = 232921;
run;

data train;
set train;
GrLivAreaDiv100 = GrLivArea / 100;
if Street = "Grvl" then StreetType = 0;
if Street = "Pave" then StreetType = 1;
if ExterQual = "Po" then ExterQualType = 1;
if ExterQual = "Fa" then ExterQualType = 2;
if ExterQual = "TA" then ExterQualType = 3;
if ExterQual = "Gd" then ExterQualType = 4;
if ExterQual = "Ex" then ExterQualType = 5;
if ExterCond = "Po" then ExterCondType = 1;
if ExterCond = "Fa" then ExterCondType = 2;
if ExterCond = "TA" then ExterCondType = 3;
if ExterCond = "Gd" then ExterCondType = 4;
if ExterCond = "Ex" then ExterCondType = 5;
if BsmtQual = "NA" then BsmtQualType = 0;
if BsmtQual = "Po" then BsmtQualType = 1;
if BsmtQual = "Fa" then BsmtQualType = 2;
if BsmtQual = "TA" then BsmtQualType = 3;
if BsmtQual = "Gd" then BsmtQualType = 4;
if BsmtQual = "Ex" then BsmtQualType = 5;
if BsmtCond = "NA" then BsmtCondType = 0;
if BsmtCond = "Po" then BsmtCondType = 1;
if BsmtCond = "Fa" then BsmtCondType = 2;
if BsmtCond = "TA" then BsmtCondType = 3;
if BsmtCond = "Gd" then BsmtCondType = 4;
if BsmtCond = "Ex" then BsmtCondType = 5;
if HeatingQC = "Po" then HeatingQCType = 1;
if HeatingQC = "Fa" then HeatingQCType = 2;
if HeatingQC = "TA" then HeatingQCType = 3;
if HeatingQC = "Gd" then HeatingQCType = 4;
if HeatingQC = "Ex" then HeatingQCType = 5;
if CentralAir = "N" then CentralAirType = 0;
if CentralAir = "Y" then CentralAirType = 1;
if KitchenQual = "Po" then KitchenQualType = 1;
if KitchenQual = "Fa" then KitchenQualType = 2;
if KitchenQual = "TA" then KitchenQualType = 3;
if KitchenQual = "Gd" then KitchenQualType = 4;
if KitchenQual = "Ex" then KitchenQualType = 5;
if FireplaceQu = "NA" then FireplaceQuType = 0;
if FireplaceQu = "Po" then FireplaceQuType = 1;
if FireplaceQu = "Fa" then FireplaceQuType = 2;
if FireplaceQu = "TA" then FireplaceQuType = 3;
if FireplaceQu = "Gd" then FireplaceQuType = 4;
if FireplaceQu = "Ex" then FireplaceQuType = 5;
if GarageQual = "NA" then GarageQualType = 0;
if GarageQual = "Po" then GarageQualType = 1;
if GarageQual = "Fa" then GarageQualType = 2;
if GarageQual = "TA" then GarageQualType = 3;
if GarageQual = "Gd" then GarageQualType = 4;
if GarageQual = "Ex" then GarageQualType = 5;
if GarageCond = "NA" then GarageCondType = 0;
if GarageCond = "Po" then GarageCondType = 1;
if GarageCond = "Fa" then GarageCondType = 2;
if GarageCond = "TA" then GarageCondType = 3;
if GarageCond = "Gd" then GarageCondType = 4;
if GarageCond = "Ex" then GarageCondType = 5;
if PavedDrive = "Y" then GarageCondType = 1;
if PavedDrive = "P" then GarageCondType = 2;
if PavedDrive = "N" then GarageCondType = 3;
if PoolQC = "NA" then PoolQCType = 0;
if PoolQC = "Po" then PoolQCType = 1;
if PoolQC = "Fa" then PoolQCType = 2;
if PoolQC = "TA" then PoolQCType = 3;
if PoolQC = "Gd" then PoolQCType = 4;
if PoolQC = "Ex" then PoolQCType = 5;
if Neighborhood = "Blmngtn" then Neighborhood_score = 203938;
if Neighborhood = "Blueste" then Neighborhood_score = 146362;
if Neighborhood = "BrDale" then Neighborhood_score = 126504;
if Neighborhood = "BrkSide" then Neighborhood_score = 150711;
if Neighborhood = "ClearCr" then Neighborhood_score = 202657;
if Neighborhood = "CollgCr" then Neighborhood_score = 199969;
if Neighborhood = "Crawfor" then Neighborhood_score = 185677;
if Neighborhood = "Edwards" then Neighborhood_score = 132978;
if Neighborhood = "Gilbert" then Neighborhood_score = 182924;
if Neighborhood = "IDOTRR" then Neighborhood_score = 123725;
if Neighborhood = "MeadowV" then Neighborhood_score = 115044;
if Neighborhood = "Mitchel" then Neighborhood_score = 167737;
if Neighborhood = "NAmes" then Neighborhood_score = 156141;
if Neighborhood = "NoRidge" then Neighborhood_score = 150446;
if Neighborhood = "NPkVill" then Neighborhood_score = 173478;
if Neighborhood = "NridgHt" then Neighborhood_score = 151800;
if Neighborhood = "NWAmes" then Neighborhood_score = 245887;
if Neighborhood = "OldTown" then Neighborhood_score = 129501;
if Neighborhood = "Sawyer" then Neighborhood_score = 130266;
if Neighborhood = "SawyerW" then Neighborhood_score = 146566;
if Neighborhood = "Somerst" then Neighborhood_score = 178029;
if Neighborhood = "StoneBr" then Neighborhood_score = 212623;
if Neighborhood = "SWISU" then Neighborhood_score = 249623;
if Neighborhood = "Timber" then Neighborhood_score = 217426;
if Neighborhood = "Veenker" then Neighborhood_score = 232921;

run;


/* Question 1 */
proc GLM data = train;
class Neighborhood;
model SalePrice = GrLivAreaDiv100 | Neighborhood / solution clparm;
WHERE Neighborhood = "NAmes" OR Neighborhood = "Edwards" OR Neighborhood = "BrkSide";
run;

proc GLM data = train;
model SalePrice = GrLivAreaDiv100 / solution;
WHERE Neighborhood = "NAmes" OR Neighborhood = "Edwards" OR Neighborhood = "BrkSide";
run;

proc reg data = train;
model SalePrice = GrLivAreaDiv100;
WHERE Neighborhood = "NAmes" OR Neighborhood = "Edwards" OR Neighborhood = "BrkSide";
run;

/* Question 2 */

/*
proc glmselect data = train;
model SalePrice = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuild YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF 1stFlrSF 2ndFlrSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath Bedroom Kitchen TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch 3SsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SaleCondition GrLivAreaDiv100 / selection = FORWARD;
run;
*/

proc GLM data = train;
class Neighborhood;
model SalePrice = GrLivArea | Neighborhood / solution clparm;
run;


/* Checking Training Data */
proc glmselect data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold  / selection = FORWARD SLENTRY=0.01 include = 0;
run;

proc glmselect data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold  / selection = BACKWARD SLENTRY=0.01 include = 0;
run;

proc glmselect data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold Neighborhood_score / selection = BACKWARD SLENTRY=1;
run;

proc glm data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold Neighborhood_score;
run;

proc glmselect data = train;
/*model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold ;*/
/*model SalePrice = GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea YrSold Neighborhood_score;*/
model SalePrice = KitchenQualType BsmtQualType ExterQualType '1stFlrSF'n '2ndFlrSF'n MSSubClass LotArea OverallQual OverallCond YearBuilt MasVnrArea TotalBsmtSF GrLivArea GarageCars GarageQualType BsmtCondType YearBuilt BsmtFullBath BedroomAbvGr TotRmsAbvGrd ScreenPorch;
run;

/* Cross validation */
proc glmselect data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold GrLivAreaDiv100 / selection = FORWARD (select = cv choose = cv stop = cv) CVDETAILS SLENTRY=0.01 include = 0;
run;

proc glmselect data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold GrLivAreaDiv100 / selection = BACKWARD (select = cv choose = cv stop = cv) CVDETAILS SLENTRY=0.01 include = 0;
run;

proc glmselect data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold GrLivAreaDiv100 Neighborhood_score/ selection = STEPWISE (select = cv choose = cv stop = cv) CVDETAILS SLENTRY=0.01 include = 0;
run;

proc glmselect data = train;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold GrLivAreaDiv100 / selection = STEPWISE (select = cv choose = cv stop = cv) CVDETAILS SLENTRY=0.01 include = 0;
run;

/* Generate Kaggle results file */
data full;
set train test;
run;

/*
proc glm data = train2 plots = all;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold;
*/

proc glmselect data = full;
model SalePrice = PoolQCType GarageCondType GarageQualType FireplaceQuType KitchenQualType CentralAirType HeatingQCType BsmtCondType BsmtQualType StreetType ExterQualType ExterCondType '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold GrLivAreaDiv100 / selection = STEPWISE (select = cv choose = cv stop = cv) CVDETAILS SLENTRY=0.01 include = 0;
output out = results p = Predict;
run;

data results2;
set results;
if Predict > 0 then SalePrice = Predict;
if Predict < 0 then SalePrice = 163000; /* the median of all sales */
keep id SalePrice;
where id > 1460;
run;

proc export data= results2
    outfile='/home/wtrevino0/MSDS 6371/results7.csv'
    dbms=csv
    replace;
run;

/* I dont remember why we were doing this */
proc reg data = train;
model SalePrice = '1stFlrSF'n '2ndFlrSF'n '3SsnPorch'n MSSubClass LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch ScreenPorch PoolArea MiscVal MoSold YrSold GrLivAreaDiv100 / selection = cp;
output out = t cookd = cookd;
plot cp.*np. / cmallows=blue vaxis=0 to 15 by 5;;
run;




/* used this to get  neighborhood price for avg sq ft aka neighborhood_score */
proc sort data= train;
by Neighborhood;
run;
proc GLM data = train;
by Neighborhood;
model SalePrice = GrLivAreaDiv100 / solution clparm;
run;

proc GLM data = train;
class Neighborhood;
model SalePrice = GrLivAreaDiv100 | Neighborhood / solution clparm;
run;