-- Add migration script here

CREATE TABLE [Account]
(
	[AccountID]          integer  NOT NULL ,
	[AccountName]        varchar(100)  NULL ,
	[StartDate]          datetime  NULL,
    CONSTRAINT [XPKAccount] PRIMARY KEY ([AccountID] ASC)
);

CREATE TABLE [Address]
(
	[Zip]                integer  NOT NULL ,
	[Address1]           varchar(200)  NOT NULL ,
	[Address2]           varchar(200)  NULL ,
	[City]               varchar(200)  NULL ,
	[State]              varchar(2)  NULL ,
	[CustSSN]            integer  NOT NULL ,
	[AssocSSN]           integer  NOT NULL ,
	[AccountID]          integer  NULL,
    CONSTRAINT [XPKAddress] PRIMARY KEY ([Zip] ASC,[Address1] ASC),
    CONSTRAINT [CUSTOMER_ADDRESS] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    CONSTRAINT [ASSOCIATE_ADDRESS] FOREIGN KEY ([AssocSSN]) REFERENCES [Associate]([AssocSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    CONSTRAINT [ACCOUNT_ADDRESS] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [ASSOC_SELL_AND_SERVICE]
(
	[AssocSSN]           integer  NOT NULL ,
	[AccountID]          integer  NOT NULL ,
	[SitCode]            integer  NOT NULL ,
	[AssocType]          varchar(20)  NULL,
    CONSTRAINT [XPKAssociate_Account] PRIMARY KEY ([AssocSSN] ASC,[AccountID] ASC,[SitCode] ASC),
    CONSTRAINT [R_3] FOREIGN KEY ([AssocSSN]) REFERENCES [Associate]([AssocSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    CONSTRAINT [R_4] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [Associate]
(
	[AssocSSN]           integer  NOT NULL ,
	[AssocFirstName]     varchar(200)  NULL ,
	[AssocLastName]      varchar(200)  NULL ,
	[AssocMiddleInitial] char  NULL ,
	[AssocSuffix]        varchar(20)  NULL ,
	[AssocPhone]         integer  NULL,
    CONSTRAINT [XPKAssociate] PRIMARY KEY ([AssocSSN] ASC)
);

CREATE TABLE [Companies]
(
	[CompanyCode]        integer  NOT NULL ,
	[CompanyName]        varchar(200)  NULL ,
	[LegacyCompanyNo]    integer  NULL,
    CONSTRAINT [XPKCompanies] PRIMARY KEY ([CompanyCode] ASC)
);

CREATE TABLE [COMPANY_MEMBER_ACCOUNT]
(
	[CompanyCode]        integer  NOT NULL ,
	[AccountID]          integer  NOT NULL,
    CONSTRAINT [XPKCompanies_Account] PRIMARY KEY ([CompanyCode] ASC,[AccountID] ASC),
    CONSTRAINT [R_14] FOREIGN KEY ([CompanyCode]) REFERENCES [Companies]([CompanyCode])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    CONSTRAINT [R_15] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [Contract]
(
	[ContractNumber]     integer  NOT NULL ,
	[CoverageType]       varchar(200)  NULL ,
	[ActivityStatus]     varchar(20)  NULL ,
	[CardType]           varchar(20)  NULL ,
	[ExpirationDate]     datetime  NULL ,
	[CreditCardNo]       integer  NULL ,
	[Duration]           integer  NULL,
    CONSTRAINT [XPKContract] PRIMARY KEY ([ContractNumber] ASC)
);

CREATE TABLE [CONTRACT_BENEFITS_CUSTOMER]
(
	[ContractNumber]     integer  NOT NULL ,
	[CustSSN]            integer  NOT NULL,
    CONSTRAINT [XPKContract_Customer] PRIMARY KEY ([ContractNumber] ASC,[CustSSN] ASC),
	CONSTRAINT [R_20] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT [R_21] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [CONTRACT_P_PRODUCT]
(
	[ContractNumber]     integer  NOT NULL ,
	[LineOfBusiness]     integer  NOT NULL,
    CONSTRAINT [XPKContract_Product] PRIMARY KEY ([ContractNumber] ASC,[LineOfBusiness] ASC),
	CONSTRAINT [R_23] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT [R_24] FOREIGN KEY ([LineOfBusiness]) REFERENCES [Product]([LineOfBusiness])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [Customer]
(
	[CustSSN]            integer  NOT NULL ,
	[CustFirstName]      varchar(200)  NULL ,
	[CustLastName]       varchar(200)  NULL ,
	[CustMiddleInitial]  char  NULL ,
	[CustSuffix]         varchar(20)  NULL ,
	[CustDOB]            datetime  NULL ,
	[Gender]             char  NULL ,
	[CustSalutation]     varchar(20)  NULL ,
	[CustAlias]          varchar(20)  NULL ,
	[CustAliasSalutation] varchar(20)  NULL,
    CONSTRAINT [XPKCustomer] PRIMARY KEY ([CustSSN] ASC)
);

CREATE TABLE [CUSTOMER_CLAIMS_CONTRACT]
(
	[CustSSN]            integer  NOT NULL ,
	[ContractNumber]     integer  NOT NULL,
    CONSTRAINT [XPKCustomer_Contract] PRIMARY KEY ([CustSSN] ASC,[ContractNumber] ASC),
	CONSTRAINT [R_17] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT [R_18] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [CUSTOMER_MEMBER_ACCOUNT]
(
	[CustSSN]            integer  NOT NULL ,
	[AccountID]          integer  NOT NULL ,
	[Type]               varchar(10)  NULL,
	CONSTRAINT [Validation_Rule_405_1312091631]
		CHECK  ( Type == 'BILLING' OR Type == 'NONBILLING' ),
    CONSTRAINT [XPKCustomer_Account] PRIMARY KEY ([CustSSN] ASC,[AccountID] ASC),
	CONSTRAINT [R_7] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT [R_8] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [LICENSE]
(
	[AssocSSN]           integer  NOT NULL ,
	[ContractNumber]     integer  NOT NULL ,
	[LicenseNumber]      integer  NOT NULL ,
	[WritingNumber]      integer  NOT NULL ,
	[LicenseState]       varchar(2)  NULL ,
	[IssueDate]          datetime  NULL ,
	[ExpirationDate]     datetime  NULL,
    CONSTRAINT [XPKAssociate_Contract] PRIMARY KEY ([AssocSSN] ASC,[WritingNumber] ASC,[LicenseNumber] ASC,[ContractNumber] ASC),
	CONSTRAINT [R_26] FOREIGN KEY ([AssocSSN]) REFERENCES [Associate]([AssocSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT [R_27] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE [Product]
(
	[LineOfBusiness]     integer  NOT NULL ,
	[GovtAgency]         varchar(200)  NULL ,
	[PSGName]            varchar(20)  NULL ,
	[PPGName]            varchar(20)  NULL ,
	[SeriesName]         varchar(20)  NULL ,
	[PlanName]           varchar(20)  NULL,
    CONSTRAINT [XPKProduct] PRIMARY KEY ([LineOfBusiness] ASC)
);

CREATE TABLE [GenericModelIns]
(
	[CustSSN]            	integer  NOT NULL ,
	[Age]                	integer  NULL ,
	[Gender]             	integer  NULL ,
	[Weight]				integer  NULL ,
	[Height]				integer  NULL ,
	[City]               	integer  NULL ,
	[Country]            	integer  NULL ,
	[SmokingHabits]      	integer  NULL ,
	[CancerHistory]		 	integer  NULL ,
	[CardiovascularHistory]	integer  NULL ,
	[DrinkingHabits]     	integer  NULL ,
	[ActivityHabits]     	integer  NULL ,
	CONSTRAINT [XPKGenericModelIns] PRIMARY KEY ([CustSSN] ASC)
	CONSTRAINT [CUSTOMER_FOR_MODEL] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);