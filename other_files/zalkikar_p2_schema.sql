
CREATE TABLE [Account]
(
	[AccountID]          integer  NOT NULL ,
	[AccountName]        varchar(100)  NULL ,
	[StartDate]          datetime  NULL
)
go

ALTER TABLE [Account]
	ADD CONSTRAINT [XPKAccount] PRIMARY KEY  CLUSTERED ([AccountID] ASC)
go

CREATE TABLE [Address]
(
	[Zip]                integer  NOT NULL ,
	[Address1]           varchar(200)  NOT NULL ,
	[Address2]           varchar(200)  NULL ,
	[City]               varchar(200)  NULL ,
	[State]              varchar(2)  NULL ,
	[CustSSN]            integer  NOT NULL ,
	[AssocSSN]           integer  NOT NULL ,
	[AccountID]          integer  NULL
)
go

ALTER TABLE [Address]
	ADD CONSTRAINT [XPKAddress] PRIMARY KEY  CLUSTERED ([Zip] ASC,[Address1] ASC)
go

CREATE TABLE [ASSOC_SELL_AND_SERVICE]
(
	[AssocSSN]           integer  NOT NULL ,
	[AccountID]          integer  NOT NULL ,
	[SitCode]            integer  NOT NULL ,
	[AssocType]          varchar(20)  NULL
)
go

ALTER TABLE [ASSOC_SELL_AND_SERVICE]
	ADD CONSTRAINT [XPKAssociate_Account] PRIMARY KEY  CLUSTERED ([AssocSSN] ASC,[AccountID] ASC,[SitCode] ASC)
go

CREATE TABLE [Associate]
(
	[AssocSSN]           integer  NOT NULL ,
	[AssocFirstName]     varchar(200)  NULL ,
	[AssocLastName]      varchar(200)  NULL ,
	[AssocMiddleInitial] char  NULL ,
	[AssocSuffix]        varchar(20)  NULL ,
	[AssocPhone]         integer  NULL
)
go

ALTER TABLE [Associate]
	ADD CONSTRAINT [XPKAssociate] PRIMARY KEY  CLUSTERED ([AssocSSN] ASC)
go

CREATE TABLE [Companies]
(
	[CompanyCode]        integer  NOT NULL ,
	[CompanyName]        varchar(200)  NULL ,
	[LegacyCompanyNo]    integer  NULL
)
go

ALTER TABLE [Companies]
	ADD CONSTRAINT [XPKCompanies] PRIMARY KEY  CLUSTERED ([CompanyCode] ASC)
go

CREATE TABLE [COMPANY_MEMBER_ACCOUNT]
(
	[CompanyCode]        integer  NOT NULL ,
	[AccountID]          integer  NOT NULL
)
go

ALTER TABLE [COMPANY_MEMBER_ACCOUNT]
	ADD CONSTRAINT [XPKCompanies_Account] PRIMARY KEY  CLUSTERED ([CompanyCode] ASC,[AccountID] ASC)
go

CREATE TABLE [Contract]
(
	[ContractNumber]     integer  NOT NULL ,
	[CoverageType]       varchar(200)  NULL ,
	[ActivityStatus]     varchar(20)  NULL ,
	[CardType]           varchar(20)  NULL ,
	[ExpirationDate]     datetime  NULL ,
	[CreditCardNo]       integer  NULL ,
	[Duration]           integer  NULL
)
go

ALTER TABLE [Contract]
	ADD CONSTRAINT [XPKContract] PRIMARY KEY  CLUSTERED ([ContractNumber] ASC)
go

CREATE TABLE [CONTRACT_BENEFITS_CUSTOMER]
(
	[ContractNumber]     integer  NOT NULL ,
	[CustSSN]            integer  NOT NULL
)
go

ALTER TABLE [CONTRACT_BENEFITS_CUSTOMER]
	ADD CONSTRAINT [XPKContract_Customer] PRIMARY KEY  CLUSTERED ([ContractNumber] ASC,[CustSSN] ASC)
go

CREATE TABLE [CONTRACT_P_PRODUCT]
(
	[ContractNumber]     integer  NOT NULL ,
	[LineOfBusiness]     integer  NOT NULL
)
go

ALTER TABLE [CONTRACT_P_PRODUCT]
	ADD CONSTRAINT [XPKContract_Product] PRIMARY KEY  CLUSTERED ([ContractNumber] ASC,[LineOfBusiness] ASC)
go

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
	[CustAliasSalutation] varchar(20)  NULL
)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustSSN] ASC)
go

CREATE TABLE [CUSTOMER_CLAIMS_CONTRACT]
(
	[CustSSN]            integer  NOT NULL ,
	[ContractNumber]     integer  NOT NULL
)
go

ALTER TABLE [CUSTOMER_CLAIMS_CONTRACT]
	ADD CONSTRAINT [XPKCustomer_Contract] PRIMARY KEY  CLUSTERED ([CustSSN] ASC,[ContractNumber] ASC)
go

CREATE TABLE [CUSTOMER_MEMBER_ACCOUNT]
(
	[CustSSN]            integer  NOT NULL ,
	[AccountID]          integer  NOT NULL ,
	[Type]               varchar(10)  NULL
	CONSTRAINT [Default_Value_406_692939870]
		 DEFAULT
	CONSTRAINT [Validation_Rule_405_1312091631]
		CHECK  ( Type == 'BILLING' OR Type == 'NONBILLING' )
)
go

ALTER TABLE [CUSTOMER_MEMBER_ACCOUNT]
	ADD CONSTRAINT [XPKCustomer_Account] PRIMARY KEY  CLUSTERED ([CustSSN] ASC,[AccountID] ASC)
go

CREATE TABLE [DepressionDisModelIns]
(
	[CustSSN]            integer  NOT NULL ,
	[DocID]              integer  NOT NULL ,
	[CommentID]          integer  NOT NULL
)
go

ALTER TABLE [DepressionDisModelIns]
	ADD CONSTRAINT [XPKDepressionDisModelIns] PRIMARY KEY  CLUSTERED ([DocID] ASC,[CommentID] ASC,[CustSSN] ASC)
go

CREATE TABLE [DepressionDisModelOuts]
(
	[CustSSN]            integer  NOT NULL ,
	[ForecastRisk]       integer  NULL ,
	[ModelID]            integer  NOT NULL
)
go

ALTER TABLE [DepressionDisModelOuts]
	ADD CONSTRAINT [XPKDepressionDisModelOuts] PRIMARY KEY  CLUSTERED ([CustSSN] ASC,[ModelID] ASC)
go

CREATE TABLE [GenericModelIns]
(
	[CustSSN]            integer  NOT NULL ,
	[Age]                integer  NULL ,
	[Gender]             integer  NULL ,
	[City]               integer  NULL ,
	[Country]            integer  NULL ,
	[SmokingHabits]      integer  NULL ,
	[DrinkingHabits]     integer  NULL ,
	[ActivityHabits]     integer  NULL
)
go

ALTER TABLE [GenericModelIns]
	ADD CONSTRAINT [XPKGenericModelIns] PRIMARY KEY  CLUSTERED ([CustSSN] ASC)
go

CREATE TABLE [KidneyDisModelIns]
(
	[CustSSN]            integer  NOT NULL ,
	[BloodPressure]      integer  NULL ,
	[SpecificGravity]    integer  NULL ,
	[Sugar]              integer  NULL ,
	[RedBloodCells]      integer  NULL ,
	[PusCell]            integer  NULL ,
	[PusCellClumps]      integer  NULL ,
	[Bacteria]           integer  NULL ,
	[BloodGlucoseRand]   integer  NULL ,
	[BloodUrea]          integer  NULL ,
	[SerumCreatinine]    integer  NULL ,
	[Sodium]             integer  NULL ,
	[Potassium]          integer  NULL ,
	[Hemoglobin]         integer  NULL ,
	[PackedCellVol]      integer  NULL ,
	[WhiteBloodCellCnt]  integer  NULL ,
	[RedBloodCellCnt]    integer  NULL ,
	[Hypertension]       integer  NULL ,
	[DiabetesMellitus]   integer  NULL ,
	[CoronaryArteryDis]  integer  NULL ,
	[Appetite]           integer  NULL ,
	[PedalEdema]         integer  NULL ,
	[Anemia]             integer  NULL ,
	[Albumin]            integer  NULL ,
	[LabTestDate]        datetime  NULL
)
go

ALTER TABLE [KidneyDisModelIns]
	ADD CONSTRAINT [XPKKidneyDisModelIns] PRIMARY KEY  CLUSTERED ([CustSSN] ASC)
go

CREATE TABLE [KidneyDisModelOuts]
(
	[CustSSN]            integer  NOT NULL ,
	[ForecastRisk]       integer  NULL ,
	[ModelID]            integer  NOT NULL
)
go

ALTER TABLE [KidneyDisModelOuts]
	ADD CONSTRAINT [XPKKidneyDisModelOuts] PRIMARY KEY  CLUSTERED ([CustSSN] ASC,[ModelID] ASC)
go

CREATE TABLE [LICENSE]
(
	[AssocSSN]           integer  NOT NULL ,
	[ContractNumber]     integer  NOT NULL ,
	[LicenseNumber]      integer  NOT NULL ,
	[WritingNumber]      integer  NOT NULL ,
	[LicenseState]       varchar(2)  NULL ,
	[IssueDate]          datetime  NULL ,
	[ExpirationDate]     datetime  NULL
)
go

ALTER TABLE [LICENSE]
	ADD CONSTRAINT [XPKAssociate_Contract] PRIMARY KEY  CLUSTERED ([AssocSSN] ASC,[WritingNumber] ASC,[LicenseNumber] ASC,[ContractNumber] ASC)
go

CREATE TABLE [Models]
(
	[ModelID]            integer  NOT NULL ,
	[ModelType]          varchar(100)  NULL ,
	[ModelDesc]          varchar(200)  NULL
)
go

ALTER TABLE [Models]
	ADD CONSTRAINT [XPKModels] PRIMARY KEY  CLUSTERED ([ModelID] ASC)
go

CREATE TABLE [Product]
(
	[LineOfBusiness]     integer  NOT NULL ,
	[GovtAgency]         varchar(200)  NULL ,
	[PSGName]            varchar(20)  NULL ,
	[PPGName]            varchar(20)  NULL ,
	[SeriesName]         varchar(20)  NULL ,
	[PlanName]           varchar(20)  NULL
)
go

ALTER TABLE [Product]
	ADD CONSTRAINT [XPKProduct] PRIMARY KEY  CLUSTERED ([LineOfBusiness] ASC)
go


ALTER TABLE [Address]
	ADD CONSTRAINT [CUSTOMER_ADDRESS] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Address]
	ADD CONSTRAINT [ASSOCIATE_ADDRESS] FOREIGN KEY ([AssocSSN]) REFERENCES [Associate]([AssocSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Address]
	ADD CONSTRAINT [ACCOUNT_ADDRESS] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ASSOC_SELL_AND_SERVICE]
	ADD CONSTRAINT [R_3] FOREIGN KEY ([AssocSSN]) REFERENCES [Associate]([AssocSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ASSOC_SELL_AND_SERVICE]
	ADD CONSTRAINT [R_4] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [COMPANY_MEMBER_ACCOUNT]
	ADD CONSTRAINT [R_14] FOREIGN KEY ([CompanyCode]) REFERENCES [Companies]([CompanyCode])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [COMPANY_MEMBER_ACCOUNT]
	ADD CONSTRAINT [R_15] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CONTRACT_BENEFITS_CUSTOMER]
	ADD CONSTRAINT [R_20] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CONTRACT_BENEFITS_CUSTOMER]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CONTRACT_P_PRODUCT]
	ADD CONSTRAINT [R_41] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CONTRACT_P_PRODUCT]
	ADD CONSTRAINT [R_42] FOREIGN KEY ([LineOfBusiness]) REFERENCES [Product]([LineOfBusiness])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CUSTOMER_CLAIMS_CONTRACT]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CUSTOMER_CLAIMS_CONTRACT]
	ADD CONSTRAINT [R_18] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CUSTOMER_MEMBER_ACCOUNT]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CUSTOMER_MEMBER_ACCOUNT]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([AccountID]) REFERENCES [Account]([AccountID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [DepressionDisModelIns]
	ADD CONSTRAINT [CUSTOMER_DEPRESSION_INFO_FOR_MODEL] FOREIGN KEY ([CustSSN]) REFERENCES [GenericModelIns]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [DepressionDisModelOuts]
	ADD CONSTRAINT [CUSTOMER_DEPRESSION_MODEL_OUTPUT] FOREIGN KEY ([CustSSN]) REFERENCES [KidneyDisModelIns]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [DepressionDisModelOuts]
	ADD CONSTRAINT [MODEL_DEPRESSION_MODEL_OUTPUT] FOREIGN KEY ([ModelID]) REFERENCES [Models]([ModelID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [GenericModelIns]
	ADD CONSTRAINT [CUSTOMER_FOR_MODEL] FOREIGN KEY ([CustSSN]) REFERENCES [Customer]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [KidneyDisModelIns]
	ADD CONSTRAINT [CUSTOMER_KIDNEY_INFO_FOR_MODEL] FOREIGN KEY ([CustSSN]) REFERENCES [GenericModelIns]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [KidneyDisModelOuts]
	ADD CONSTRAINT [CUSTOMER_KIDNEY_MODEL_OUTPUT] FOREIGN KEY ([CustSSN]) REFERENCES [KidneyDisModelIns]([CustSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [KidneyDisModelOuts]
	ADD CONSTRAINT [MODEL_KIDNEY_MODEL_OUTPUT] FOREIGN KEY ([ModelID]) REFERENCES [Models]([ModelID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [LICENSE]
	ADD CONSTRAINT [R_26] FOREIGN KEY ([AssocSSN]) REFERENCES [Associate]([AssocSSN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [LICENSE]
	ADD CONSTRAINT [R_27] FOREIGN KEY ([ContractNumber]) REFERENCES [Contract]([ContractNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Account ON Account FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Account */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Account  COMPANY_MEMBER_ACCOUNT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004339f", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_15", FK_COLUMNS="AccountID" */
    IF EXISTS (
      SELECT * FROM deleted,COMPANY_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(COMPANY_MEMBER_ACCOUNT,deleted," = "," AND") */
        COMPANY_MEMBER_ACCOUNT.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Account because COMPANY_MEMBER_ACCOUNT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Account  Address on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ACCOUNT_ADDRESS", FK_COLUMNS="AccountID" */
    IF EXISTS (
      SELECT * FROM deleted,Address
      WHERE
        /*  %JoinFKPK(Address,deleted," = "," AND") */
        Address.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Account because Address exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Account  CUSTOMER_MEMBER_ACCOUNT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_8", FK_COLUMNS="AccountID" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(CUSTOMER_MEMBER_ACCOUNT,deleted," = "," AND") */
        CUSTOMER_MEMBER_ACCOUNT.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Account because CUSTOMER_MEMBER_ACCOUNT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Account  ASSOC_SELL_AND_SERVICE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_4", FK_COLUMNS="AccountID" */
    IF EXISTS (
      SELECT * FROM deleted,ASSOC_SELL_AND_SERVICE
      WHERE
        /*  %JoinFKPK(ASSOC_SELL_AND_SERVICE,deleted," = "," AND") */
        ASSOC_SELL_AND_SERVICE.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Account because ASSOC_SELL_AND_SERVICE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Account ON Account FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Account */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAccountID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Account  COMPANY_MEMBER_ACCOUNT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004a724", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_15", FK_COLUMNS="AccountID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,COMPANY_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(COMPANY_MEMBER_ACCOUNT,deleted," = "," AND") */
        COMPANY_MEMBER_ACCOUNT.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Account because COMPANY_MEMBER_ACCOUNT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Account  Address on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ACCOUNT_ADDRESS", FK_COLUMNS="AccountID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Address
      WHERE
        /*  %JoinFKPK(Address,deleted," = "," AND") */
        Address.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Account because Address exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Account  CUSTOMER_MEMBER_ACCOUNT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_8", FK_COLUMNS="AccountID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(CUSTOMER_MEMBER_ACCOUNT,deleted," = "," AND") */
        CUSTOMER_MEMBER_ACCOUNT.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Account because CUSTOMER_MEMBER_ACCOUNT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Account  ASSOC_SELL_AND_SERVICE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_4", FK_COLUMNS="AccountID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,ASSOC_SELL_AND_SERVICE
      WHERE
        /*  %JoinFKPK(ASSOC_SELL_AND_SERVICE,deleted," = "," AND") */
        ASSOC_SELL_AND_SERVICE.AccountID = deleted.AccountID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Account because ASSOC_SELL_AND_SERVICE exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Address ON Address FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Address */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Account  Address on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00038c46", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ACCOUNT_ADDRESS", FK_COLUMNS="AccountID" */
    IF EXISTS (SELECT * FROM deleted,Account
      WHERE
        /* %JoinFKPK(deleted,Account," = "," AND") */
        deleted.AccountID = Account.AccountID AND
        NOT EXISTS (
          SELECT * FROM Address
          WHERE
            /* %JoinFKPK(Address,Account," = "," AND") */
            Address.AccountID = Account.AccountID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Address because Account exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Associate  Address on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ASSOCIATE_ADDRESS", FK_COLUMNS="AssocSSN" */
    IF EXISTS (SELECT * FROM deleted,Associate
      WHERE
        /* %JoinFKPK(deleted,Associate," = "," AND") */
        deleted.AssocSSN = Associate.AssocSSN AND
        NOT EXISTS (
          SELECT * FROM Address
          WHERE
            /* %JoinFKPK(Address,Associate," = "," AND") */
            Address.AssocSSN = Associate.AssocSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Address because Associate exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Address on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_ADDRESS", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustSSN = Customer.CustSSN AND
        NOT EXISTS (
          SELECT * FROM Address
          WHERE
            /* %JoinFKPK(Address,Customer," = "," AND") */
            Address.CustSSN = Customer.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Address because Customer exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Address ON Address FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Address */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insZip integer,
           @insAddress1 varchar(200),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Account  Address on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00042439", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ACCOUNT_ADDRESS", FK_COLUMNS="AccountID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Account
        WHERE
          /* %JoinFKPK(inserted,Account) */
          inserted.AccountID = Account.AccountID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.AccountID IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Address because Account does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Associate  Address on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ASSOCIATE_ADDRESS", FK_COLUMNS="AssocSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AssocSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Associate
        WHERE
          /* %JoinFKPK(inserted,Associate) */
          inserted.AssocSSN = Associate.AssocSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Address because Associate does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Address on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_ADDRESS", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustSSN = Customer.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Address because Customer does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_ASSOC_SELL_AND_SERVICE ON ASSOC_SELL_AND_SERVICE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ASSOC_SELL_AND_SERVICE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Account  ASSOC_SELL_AND_SERVICE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002a645", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_4", FK_COLUMNS="AccountID" */
    IF EXISTS (SELECT * FROM deleted,Account
      WHERE
        /* %JoinFKPK(deleted,Account," = "," AND") */
        deleted.AccountID = Account.AccountID AND
        NOT EXISTS (
          SELECT * FROM ASSOC_SELL_AND_SERVICE
          WHERE
            /* %JoinFKPK(ASSOC_SELL_AND_SERVICE,Account," = "," AND") */
            ASSOC_SELL_AND_SERVICE.AccountID = Account.AccountID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last ASSOC_SELL_AND_SERVICE because Account exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Associate  ASSOC_SELL_AND_SERVICE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_3", FK_COLUMNS="AssocSSN" */
    IF EXISTS (SELECT * FROM deleted,Associate
      WHERE
        /* %JoinFKPK(deleted,Associate," = "," AND") */
        deleted.AssocSSN = Associate.AssocSSN AND
        NOT EXISTS (
          SELECT * FROM ASSOC_SELL_AND_SERVICE
          WHERE
            /* %JoinFKPK(ASSOC_SELL_AND_SERVICE,Associate," = "," AND") */
            ASSOC_SELL_AND_SERVICE.AssocSSN = Associate.AssocSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last ASSOC_SELL_AND_SERVICE because Associate exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_ASSOC_SELL_AND_SERVICE ON ASSOC_SELL_AND_SERVICE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ASSOC_SELL_AND_SERVICE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAssocSSN integer,
           @insAccountID integer,
           @insSitCode integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Account  ASSOC_SELL_AND_SERVICE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c338", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_4", FK_COLUMNS="AccountID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Account
        WHERE
          /* %JoinFKPK(inserted,Account) */
          inserted.AccountID = Account.AccountID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ASSOC_SELL_AND_SERVICE because Account does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Associate  ASSOC_SELL_AND_SERVICE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_3", FK_COLUMNS="AssocSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AssocSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Associate
        WHERE
          /* %JoinFKPK(inserted,Associate) */
          inserted.AssocSSN = Associate.AssocSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ASSOC_SELL_AND_SERVICE because Associate does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Associate ON Associate FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Associate */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Associate  LICENSE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00030969", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="AssocSSN" */
    IF EXISTS (
      SELECT * FROM deleted,LICENSE
      WHERE
        /*  %JoinFKPK(LICENSE,deleted," = "," AND") */
        LICENSE.AssocSSN = deleted.AssocSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Associate because LICENSE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Associate  Address on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ASSOCIATE_ADDRESS", FK_COLUMNS="AssocSSN" */
    IF EXISTS (
      SELECT * FROM deleted,Address
      WHERE
        /*  %JoinFKPK(Address,deleted," = "," AND") */
        Address.AssocSSN = deleted.AssocSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Associate because Address exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Associate  ASSOC_SELL_AND_SERVICE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_3", FK_COLUMNS="AssocSSN" */
    IF EXISTS (
      SELECT * FROM deleted,ASSOC_SELL_AND_SERVICE
      WHERE
        /*  %JoinFKPK(ASSOC_SELL_AND_SERVICE,deleted," = "," AND") */
        ASSOC_SELL_AND_SERVICE.AssocSSN = deleted.AssocSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Associate because ASSOC_SELL_AND_SERVICE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Associate ON Associate FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Associate */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAssocSSN integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Associate  LICENSE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00034c11", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="AssocSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AssocSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,LICENSE
      WHERE
        /*  %JoinFKPK(LICENSE,deleted," = "," AND") */
        LICENSE.AssocSSN = deleted.AssocSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Associate because LICENSE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Associate  Address on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="ASSOCIATE_ADDRESS", FK_COLUMNS="AssocSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AssocSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Address
      WHERE
        /*  %JoinFKPK(Address,deleted," = "," AND") */
        Address.AssocSSN = deleted.AssocSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Associate because Address exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Associate  ASSOC_SELL_AND_SERVICE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="ASSOC_SELL_AND_SERVICE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_3", FK_COLUMNS="AssocSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AssocSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,ASSOC_SELL_AND_SERVICE
      WHERE
        /*  %JoinFKPK(ASSOC_SELL_AND_SERVICE,deleted," = "," AND") */
        ASSOC_SELL_AND_SERVICE.AssocSSN = deleted.AssocSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Associate because ASSOC_SELL_AND_SERVICE exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Companies ON Companies FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Companies */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Companies  COMPANY_MEMBER_ACCOUNT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012bd1", PARENT_OWNER="", PARENT_TABLE="Companies"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyCode" */
    IF EXISTS (
      SELECT * FROM deleted,COMPANY_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(COMPANY_MEMBER_ACCOUNT,deleted," = "," AND") */
        COMPANY_MEMBER_ACCOUNT.CompanyCode = deleted.CompanyCode
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Companies because COMPANY_MEMBER_ACCOUNT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Companies ON Companies FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Companies */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCompanyCode integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Companies  COMPANY_MEMBER_ACCOUNT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000156d2", PARENT_OWNER="", PARENT_TABLE="Companies"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyCode" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CompanyCode)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,COMPANY_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(COMPANY_MEMBER_ACCOUNT,deleted," = "," AND") */
        COMPANY_MEMBER_ACCOUNT.CompanyCode = deleted.CompanyCode
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Companies because COMPANY_MEMBER_ACCOUNT exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_COMPANY_MEMBER_ACCOUNT ON COMPANY_MEMBER_ACCOUNT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on COMPANY_MEMBER_ACCOUNT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Account  COMPANY_MEMBER_ACCOUNT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002c48b", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_15", FK_COLUMNS="AccountID" */
    IF EXISTS (SELECT * FROM deleted,Account
      WHERE
        /* %JoinFKPK(deleted,Account," = "," AND") */
        deleted.AccountID = Account.AccountID AND
        NOT EXISTS (
          SELECT * FROM COMPANY_MEMBER_ACCOUNT
          WHERE
            /* %JoinFKPK(COMPANY_MEMBER_ACCOUNT,Account," = "," AND") */
            COMPANY_MEMBER_ACCOUNT.AccountID = Account.AccountID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last COMPANY_MEMBER_ACCOUNT because Account exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Companies  COMPANY_MEMBER_ACCOUNT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Companies"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyCode" */
    IF EXISTS (SELECT * FROM deleted,Companies
      WHERE
        /* %JoinFKPK(deleted,Companies," = "," AND") */
        deleted.CompanyCode = Companies.CompanyCode AND
        NOT EXISTS (
          SELECT * FROM COMPANY_MEMBER_ACCOUNT
          WHERE
            /* %JoinFKPK(COMPANY_MEMBER_ACCOUNT,Companies," = "," AND") */
            COMPANY_MEMBER_ACCOUNT.CompanyCode = Companies.CompanyCode
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last COMPANY_MEMBER_ACCOUNT because Companies exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_COMPANY_MEMBER_ACCOUNT ON COMPANY_MEMBER_ACCOUNT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on COMPANY_MEMBER_ACCOUNT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCompanyCode integer,
           @insAccountID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Account  COMPANY_MEMBER_ACCOUNT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002ca95", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_15", FK_COLUMNS="AccountID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Account
        WHERE
          /* %JoinFKPK(inserted,Account) */
          inserted.AccountID = Account.AccountID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update COMPANY_MEMBER_ACCOUNT because Account does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Companies  COMPANY_MEMBER_ACCOUNT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Companies"
    CHILD_OWNER="", CHILD_TABLE="COMPANY_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyCode" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CompanyCode)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Companies
        WHERE
          /* %JoinFKPK(inserted,Companies) */
          inserted.CompanyCode = Companies.CompanyCode
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update COMPANY_MEMBER_ACCOUNT because Companies does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Contract ON Contract FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Contract */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Contract  CONTRACT_P_PRODUCT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004633e", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_41", FK_COLUMNS="ContractNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_P_PRODUCT
      WHERE
        /*  %JoinFKPK(CONTRACT_P_PRODUCT,deleted," = "," AND") */
        CONTRACT_P_PRODUCT.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Contract because CONTRACT_P_PRODUCT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Contract  LICENSE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_27", FK_COLUMNS="ContractNumber" */
    IF EXISTS (
      SELECT * FROM deleted,LICENSE
      WHERE
        /*  %JoinFKPK(LICENSE,deleted," = "," AND") */
        LICENSE.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Contract because LICENSE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Contract  CONTRACT_BENEFITS_CUSTOMER on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_20", FK_COLUMNS="ContractNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_BENEFITS_CUSTOMER
      WHERE
        /*  %JoinFKPK(CONTRACT_BENEFITS_CUSTOMER,deleted," = "," AND") */
        CONTRACT_BENEFITS_CUSTOMER.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Contract because CONTRACT_BENEFITS_CUSTOMER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Contract  CUSTOMER_CLAIMS_CONTRACT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_18", FK_COLUMNS="ContractNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_CLAIMS_CONTRACT
      WHERE
        /*  %JoinFKPK(CUSTOMER_CLAIMS_CONTRACT,deleted," = "," AND") */
        CUSTOMER_CLAIMS_CONTRACT.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Contract because CUSTOMER_CLAIMS_CONTRACT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Contract ON Contract FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Contract */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insContractNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Contract  CONTRACT_P_PRODUCT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004bd76", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_41", FK_COLUMNS="ContractNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_P_PRODUCT
      WHERE
        /*  %JoinFKPK(CONTRACT_P_PRODUCT,deleted," = "," AND") */
        CONTRACT_P_PRODUCT.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Contract because CONTRACT_P_PRODUCT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Contract  LICENSE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_27", FK_COLUMNS="ContractNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,LICENSE
      WHERE
        /*  %JoinFKPK(LICENSE,deleted," = "," AND") */
        LICENSE.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Contract because LICENSE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Contract  CONTRACT_BENEFITS_CUSTOMER on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_20", FK_COLUMNS="ContractNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_BENEFITS_CUSTOMER
      WHERE
        /*  %JoinFKPK(CONTRACT_BENEFITS_CUSTOMER,deleted," = "," AND") */
        CONTRACT_BENEFITS_CUSTOMER.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Contract because CONTRACT_BENEFITS_CUSTOMER exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Contract  CUSTOMER_CLAIMS_CONTRACT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_18", FK_COLUMNS="ContractNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_CLAIMS_CONTRACT
      WHERE
        /*  %JoinFKPK(CUSTOMER_CLAIMS_CONTRACT,deleted," = "," AND") */
        CUSTOMER_CLAIMS_CONTRACT.ContractNumber = deleted.ContractNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Contract because CUSTOMER_CLAIMS_CONTRACT exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CONTRACT_BENEFITS_CUSTOMER ON CONTRACT_BENEFITS_CUSTOMER FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CONTRACT_BENEFITS_CUSTOMER */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer  CONTRACT_BENEFITS_CUSTOMER on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002d870", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustSSN = Customer.CustSSN AND
        NOT EXISTS (
          SELECT * FROM CONTRACT_BENEFITS_CUSTOMER
          WHERE
            /* %JoinFKPK(CONTRACT_BENEFITS_CUSTOMER,Customer," = "," AND") */
            CONTRACT_BENEFITS_CUSTOMER.CustSSN = Customer.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CONTRACT_BENEFITS_CUSTOMER because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Contract  CONTRACT_BENEFITS_CUSTOMER on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_20", FK_COLUMNS="ContractNumber" */
    IF EXISTS (SELECT * FROM deleted,Contract
      WHERE
        /* %JoinFKPK(deleted,Contract," = "," AND") */
        deleted.ContractNumber = Contract.ContractNumber AND
        NOT EXISTS (
          SELECT * FROM CONTRACT_BENEFITS_CUSTOMER
          WHERE
            /* %JoinFKPK(CONTRACT_BENEFITS_CUSTOMER,Contract," = "," AND") */
            CONTRACT_BENEFITS_CUSTOMER.ContractNumber = Contract.ContractNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CONTRACT_BENEFITS_CUSTOMER because Contract exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CONTRACT_BENEFITS_CUSTOMER ON CONTRACT_BENEFITS_CUSTOMER FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CONTRACT_BENEFITS_CUSTOMER */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insContractNumber integer,
           @insCustSSN integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  CONTRACT_BENEFITS_CUSTOMER on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c34a", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustSSN = Customer.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CONTRACT_BENEFITS_CUSTOMER because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Contract  CONTRACT_BENEFITS_CUSTOMER on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_20", FK_COLUMNS="ContractNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Contract
        WHERE
          /* %JoinFKPK(inserted,Contract) */
          inserted.ContractNumber = Contract.ContractNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CONTRACT_BENEFITS_CUSTOMER because Contract does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CONTRACT_P_PRODUCT ON CONTRACT_P_PRODUCT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CONTRACT_P_PRODUCT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Product  CONTRACT_P_PRODUCT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002b7a9", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_42", FK_COLUMNS="LineOfBusiness" */
    IF EXISTS (SELECT * FROM deleted,Product
      WHERE
        /* %JoinFKPK(deleted,Product," = "," AND") */
        deleted.LineOfBusiness = Product.LineOfBusiness AND
        NOT EXISTS (
          SELECT * FROM CONTRACT_P_PRODUCT
          WHERE
            /* %JoinFKPK(CONTRACT_P_PRODUCT,Product," = "," AND") */
            CONTRACT_P_PRODUCT.LineOfBusiness = Product.LineOfBusiness
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CONTRACT_P_PRODUCT because Product exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Contract  CONTRACT_P_PRODUCT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_41", FK_COLUMNS="ContractNumber" */
    IF EXISTS (SELECT * FROM deleted,Contract
      WHERE
        /* %JoinFKPK(deleted,Contract," = "," AND") */
        deleted.ContractNumber = Contract.ContractNumber AND
        NOT EXISTS (
          SELECT * FROM CONTRACT_P_PRODUCT
          WHERE
            /* %JoinFKPK(CONTRACT_P_PRODUCT,Contract," = "," AND") */
            CONTRACT_P_PRODUCT.ContractNumber = Contract.ContractNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CONTRACT_P_PRODUCT because Contract exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CONTRACT_P_PRODUCT ON CONTRACT_P_PRODUCT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CONTRACT_P_PRODUCT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insContractNumber integer,
           @insLineOfBusiness integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Product  CONTRACT_P_PRODUCT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d5f6", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_42", FK_COLUMNS="LineOfBusiness" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(LineOfBusiness)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Product
        WHERE
          /* %JoinFKPK(inserted,Product) */
          inserted.LineOfBusiness = Product.LineOfBusiness
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CONTRACT_P_PRODUCT because Product does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Contract  CONTRACT_P_PRODUCT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_41", FK_COLUMNS="ContractNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Contract
        WHERE
          /* %JoinFKPK(inserted,Contract) */
          inserted.ContractNumber = Contract.ContractNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CONTRACT_P_PRODUCT because Contract does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Customer ON Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer  GenericModelIns on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00054e18", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="GenericModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_FOR_MODEL", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,GenericModelIns
      WHERE
        /*  %JoinFKPK(GenericModelIns,deleted," = "," AND") */
        GenericModelIns.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because GenericModelIns exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  CONTRACT_BENEFITS_CUSTOMER on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_BENEFITS_CUSTOMER
      WHERE
        /*  %JoinFKPK(CONTRACT_BENEFITS_CUSTOMER,deleted," = "," AND") */
        CONTRACT_BENEFITS_CUSTOMER.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CONTRACT_BENEFITS_CUSTOMER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  CUSTOMER_CLAIMS_CONTRACT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_17", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_CLAIMS_CONTRACT
      WHERE
        /*  %JoinFKPK(CUSTOMER_CLAIMS_CONTRACT,deleted," = "," AND") */
        CUSTOMER_CLAIMS_CONTRACT.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CUSTOMER_CLAIMS_CONTRACT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Address on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_ADDRESS", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,Address
      WHERE
        /*  %JoinFKPK(Address,deleted," = "," AND") */
        Address.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Address exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  CUSTOMER_MEMBER_ACCOUNT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_7", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(CUSTOMER_MEMBER_ACCOUNT,deleted," = "," AND") */
        CUSTOMER_MEMBER_ACCOUNT.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CUSTOMER_MEMBER_ACCOUNT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Customer ON Customer FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Customer */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  GenericModelIns on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005d18b", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="GenericModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_FOR_MODEL", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,GenericModelIns
      WHERE
        /*  %JoinFKPK(GenericModelIns,deleted," = "," AND") */
        GenericModelIns.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because GenericModelIns exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  CONTRACT_BENEFITS_CUSTOMER on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_BENEFITS_CUSTOMER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_BENEFITS_CUSTOMER
      WHERE
        /*  %JoinFKPK(CONTRACT_BENEFITS_CUSTOMER,deleted," = "," AND") */
        CONTRACT_BENEFITS_CUSTOMER.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CONTRACT_BENEFITS_CUSTOMER exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  CUSTOMER_CLAIMS_CONTRACT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_17", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_CLAIMS_CONTRACT
      WHERE
        /*  %JoinFKPK(CUSTOMER_CLAIMS_CONTRACT,deleted," = "," AND") */
        CUSTOMER_CLAIMS_CONTRACT.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CUSTOMER_CLAIMS_CONTRACT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Address on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_ADDRESS", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Address
      WHERE
        /*  %JoinFKPK(Address,deleted," = "," AND") */
        Address.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Address exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  CUSTOMER_MEMBER_ACCOUNT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_7", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CUSTOMER_MEMBER_ACCOUNT
      WHERE
        /*  %JoinFKPK(CUSTOMER_MEMBER_ACCOUNT,deleted," = "," AND") */
        CUSTOMER_MEMBER_ACCOUNT.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CUSTOMER_MEMBER_ACCOUNT exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUSTOMER_CLAIMS_CONTRACT ON CUSTOMER_CLAIMS_CONTRACT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTOMER_CLAIMS_CONTRACT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Contract  CUSTOMER_CLAIMS_CONTRACT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002ce43", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_18", FK_COLUMNS="ContractNumber" */
    IF EXISTS (SELECT * FROM deleted,Contract
      WHERE
        /* %JoinFKPK(deleted,Contract," = "," AND") */
        deleted.ContractNumber = Contract.ContractNumber AND
        NOT EXISTS (
          SELECT * FROM CUSTOMER_CLAIMS_CONTRACT
          WHERE
            /* %JoinFKPK(CUSTOMER_CLAIMS_CONTRACT,Contract," = "," AND") */
            CUSTOMER_CLAIMS_CONTRACT.ContractNumber = Contract.ContractNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTOMER_CLAIMS_CONTRACT because Contract exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  CUSTOMER_CLAIMS_CONTRACT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_17", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustSSN = Customer.CustSSN AND
        NOT EXISTS (
          SELECT * FROM CUSTOMER_CLAIMS_CONTRACT
          WHERE
            /* %JoinFKPK(CUSTOMER_CLAIMS_CONTRACT,Customer," = "," AND") */
            CUSTOMER_CLAIMS_CONTRACT.CustSSN = Customer.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTOMER_CLAIMS_CONTRACT because Customer exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUSTOMER_CLAIMS_CONTRACT ON CUSTOMER_CLAIMS_CONTRACT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTOMER_CLAIMS_CONTRACT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @insContractNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Contract  CUSTOMER_CLAIMS_CONTRACT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002e2e5", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_18", FK_COLUMNS="ContractNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Contract
        WHERE
          /* %JoinFKPK(inserted,Contract) */
          inserted.ContractNumber = Contract.ContractNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTOMER_CLAIMS_CONTRACT because Contract does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  CUSTOMER_CLAIMS_CONTRACT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_CLAIMS_CONTRACT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_17", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustSSN = Customer.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTOMER_CLAIMS_CONTRACT because Customer does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUSTOMER_MEMBER_ACCOUNT ON CUSTOMER_MEMBER_ACCOUNT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTOMER_MEMBER_ACCOUNT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Account  CUSTOMER_MEMBER_ACCOUNT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002d01b", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_8", FK_COLUMNS="AccountID" */
    IF EXISTS (SELECT * FROM deleted,Account
      WHERE
        /* %JoinFKPK(deleted,Account," = "," AND") */
        deleted.AccountID = Account.AccountID AND
        NOT EXISTS (
          SELECT * FROM CUSTOMER_MEMBER_ACCOUNT
          WHERE
            /* %JoinFKPK(CUSTOMER_MEMBER_ACCOUNT,Account," = "," AND") */
            CUSTOMER_MEMBER_ACCOUNT.AccountID = Account.AccountID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTOMER_MEMBER_ACCOUNT because Account exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  CUSTOMER_MEMBER_ACCOUNT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_7", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustSSN = Customer.CustSSN AND
        NOT EXISTS (
          SELECT * FROM CUSTOMER_MEMBER_ACCOUNT
          WHERE
            /* %JoinFKPK(CUSTOMER_MEMBER_ACCOUNT,Customer," = "," AND") */
            CUSTOMER_MEMBER_ACCOUNT.CustSSN = Customer.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CUSTOMER_MEMBER_ACCOUNT because Customer exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUSTOMER_MEMBER_ACCOUNT ON CUSTOMER_MEMBER_ACCOUNT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTOMER_MEMBER_ACCOUNT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @insAccountID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Account  CUSTOMER_MEMBER_ACCOUNT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c273", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_8", FK_COLUMNS="AccountID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AccountID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Account
        WHERE
          /* %JoinFKPK(inserted,Account) */
          inserted.AccountID = Account.AccountID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTOMER_MEMBER_ACCOUNT because Account does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  CUSTOMER_MEMBER_ACCOUNT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CUSTOMER_MEMBER_ACCOUNT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_7", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustSSN = Customer.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CUSTOMER_MEMBER_ACCOUNT because Customer does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_DepressionDisModelIns ON DepressionDisModelIns FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on DepressionDisModelIns */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* GenericModelIns  DepressionDisModelIns on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001977c", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,GenericModelIns
      WHERE
        /* %JoinFKPK(deleted,GenericModelIns," = "," AND") */
        deleted.CustSSN = GenericModelIns.CustSSN AND
        NOT EXISTS (
          SELECT * FROM DepressionDisModelIns
          WHERE
            /* %JoinFKPK(DepressionDisModelIns,GenericModelIns," = "," AND") */
            DepressionDisModelIns.CustSSN = GenericModelIns.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last DepressionDisModelIns because GenericModelIns exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_DepressionDisModelIns ON DepressionDisModelIns FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on DepressionDisModelIns */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @insDocID integer,
           @insCommentID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* GenericModelIns  DepressionDisModelIns on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000195b8", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,GenericModelIns
        WHERE
          /* %JoinFKPK(inserted,GenericModelIns) */
          inserted.CustSSN = GenericModelIns.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update DepressionDisModelIns because GenericModelIns does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_DepressionDisModelOuts ON DepressionDisModelOuts FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on DepressionDisModelOuts */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Models  DepressionDisModelOuts on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002ea81", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
    IF EXISTS (SELECT * FROM deleted,Models
      WHERE
        /* %JoinFKPK(deleted,Models," = "," AND") */
        deleted.ModelID = Models.ModelID AND
        NOT EXISTS (
          SELECT * FROM DepressionDisModelOuts
          WHERE
            /* %JoinFKPK(DepressionDisModelOuts,Models," = "," AND") */
            DepressionDisModelOuts.ModelID = Models.ModelID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last DepressionDisModelOuts because Models exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* KidneyDisModelIns  DepressionDisModelOuts on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,KidneyDisModelIns
      WHERE
        /* %JoinFKPK(deleted,KidneyDisModelIns," = "," AND") */
        deleted.CustSSN = KidneyDisModelIns.CustSSN AND
        NOT EXISTS (
          SELECT * FROM DepressionDisModelOuts
          WHERE
            /* %JoinFKPK(DepressionDisModelOuts,KidneyDisModelIns," = "," AND") */
            DepressionDisModelOuts.CustSSN = KidneyDisModelIns.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last DepressionDisModelOuts because KidneyDisModelIns exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_DepressionDisModelOuts ON DepressionDisModelOuts FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on DepressionDisModelOuts */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @insModelID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Models  DepressionDisModelOuts on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f6e0", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ModelID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Models
        WHERE
          /* %JoinFKPK(inserted,Models) */
          inserted.ModelID = Models.ModelID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update DepressionDisModelOuts because Models does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* KidneyDisModelIns  DepressionDisModelOuts on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,KidneyDisModelIns
        WHERE
          /* %JoinFKPK(inserted,KidneyDisModelIns) */
          inserted.CustSSN = KidneyDisModelIns.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update DepressionDisModelOuts because KidneyDisModelIns does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_GenericModelIns ON GenericModelIns FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on GenericModelIns */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* GenericModelIns  DepressionDisModelIns on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00038e13", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,DepressionDisModelIns
      WHERE
        /*  %JoinFKPK(DepressionDisModelIns,deleted," = "," AND") */
        DepressionDisModelIns.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete GenericModelIns because DepressionDisModelIns exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* GenericModelIns  KidneyDisModelIns on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,KidneyDisModelIns
      WHERE
        /*  %JoinFKPK(KidneyDisModelIns,deleted," = "," AND") */
        KidneyDisModelIns.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete GenericModelIns because KidneyDisModelIns exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  GenericModelIns on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="GenericModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_FOR_MODEL", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustSSN = Customer.CustSSN AND
        NOT EXISTS (
          SELECT * FROM GenericModelIns
          WHERE
            /* %JoinFKPK(GenericModelIns,Customer," = "," AND") */
            GenericModelIns.CustSSN = Customer.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last GenericModelIns because Customer exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_GenericModelIns ON GenericModelIns FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on GenericModelIns */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* GenericModelIns  DepressionDisModelIns on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003ea82", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,DepressionDisModelIns
      WHERE
        /*  %JoinFKPK(DepressionDisModelIns,deleted," = "," AND") */
        DepressionDisModelIns.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update GenericModelIns because DepressionDisModelIns exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* GenericModelIns  KidneyDisModelIns on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,KidneyDisModelIns
      WHERE
        /*  %JoinFKPK(KidneyDisModelIns,deleted," = "," AND") */
        KidneyDisModelIns.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update GenericModelIns because KidneyDisModelIns exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  GenericModelIns on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="GenericModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_FOR_MODEL", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustSSN = Customer.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update GenericModelIns because Customer does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_KidneyDisModelIns ON KidneyDisModelIns FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on KidneyDisModelIns */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* KidneyDisModelIns  DepressionDisModelOuts on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003cf8d", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,DepressionDisModelOuts
      WHERE
        /*  %JoinFKPK(DepressionDisModelOuts,deleted," = "," AND") */
        DepressionDisModelOuts.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete KidneyDisModelIns because DepressionDisModelOuts exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* KidneyDisModelIns  KidneyDisModelOuts on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
    IF EXISTS (
      SELECT * FROM deleted,KidneyDisModelOuts
      WHERE
        /*  %JoinFKPK(KidneyDisModelOuts,deleted," = "," AND") */
        KidneyDisModelOuts.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete KidneyDisModelIns because KidneyDisModelOuts exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* GenericModelIns  KidneyDisModelIns on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,GenericModelIns
      WHERE
        /* %JoinFKPK(deleted,GenericModelIns," = "," AND") */
        deleted.CustSSN = GenericModelIns.CustSSN AND
        NOT EXISTS (
          SELECT * FROM KidneyDisModelIns
          WHERE
            /* %JoinFKPK(KidneyDisModelIns,GenericModelIns," = "," AND") */
            KidneyDisModelIns.CustSSN = GenericModelIns.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last KidneyDisModelIns because GenericModelIns exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_KidneyDisModelIns ON KidneyDisModelIns FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on KidneyDisModelIns */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* KidneyDisModelIns  DepressionDisModelOuts on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000407d5", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,DepressionDisModelOuts
      WHERE
        /*  %JoinFKPK(DepressionDisModelOuts,deleted," = "," AND") */
        DepressionDisModelOuts.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update KidneyDisModelIns because DepressionDisModelOuts exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* KidneyDisModelIns  KidneyDisModelOuts on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,KidneyDisModelOuts
      WHERE
        /*  %JoinFKPK(KidneyDisModelOuts,deleted," = "," AND") */
        KidneyDisModelOuts.CustSSN = deleted.CustSSN
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update KidneyDisModelIns because KidneyDisModelOuts exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* GenericModelIns  KidneyDisModelIns on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GenericModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelIns"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_INFO_FOR_MODEL", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,GenericModelIns
        WHERE
          /* %JoinFKPK(inserted,GenericModelIns) */
          inserted.CustSSN = GenericModelIns.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update KidneyDisModelIns because GenericModelIns does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_KidneyDisModelOuts ON KidneyDisModelOuts FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on KidneyDisModelOuts */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Models  KidneyDisModelOuts on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002d370", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
    IF EXISTS (SELECT * FROM deleted,Models
      WHERE
        /* %JoinFKPK(deleted,Models," = "," AND") */
        deleted.ModelID = Models.ModelID AND
        NOT EXISTS (
          SELECT * FROM KidneyDisModelOuts
          WHERE
            /* %JoinFKPK(KidneyDisModelOuts,Models," = "," AND") */
            KidneyDisModelOuts.ModelID = Models.ModelID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last KidneyDisModelOuts because Models exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* KidneyDisModelIns  KidneyDisModelOuts on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
    IF EXISTS (SELECT * FROM deleted,KidneyDisModelIns
      WHERE
        /* %JoinFKPK(deleted,KidneyDisModelIns," = "," AND") */
        deleted.CustSSN = KidneyDisModelIns.CustSSN AND
        NOT EXISTS (
          SELECT * FROM KidneyDisModelOuts
          WHERE
            /* %JoinFKPK(KidneyDisModelOuts,KidneyDisModelIns," = "," AND") */
            KidneyDisModelOuts.CustSSN = KidneyDisModelIns.CustSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last KidneyDisModelOuts because KidneyDisModelIns exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_KidneyDisModelOuts ON KidneyDisModelOuts FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on KidneyDisModelOuts */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustSSN integer,
           @insModelID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Models  KidneyDisModelOuts on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002def4", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ModelID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Models
        WHERE
          /* %JoinFKPK(inserted,Models) */
          inserted.ModelID = Models.ModelID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update KidneyDisModelOuts because Models does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* KidneyDisModelIns  KidneyDisModelOuts on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="KidneyDisModelIns"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="CUSTOMER_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="CustSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,KidneyDisModelIns
        WHERE
          /* %JoinFKPK(inserted,KidneyDisModelIns) */
          inserted.CustSSN = KidneyDisModelIns.CustSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update KidneyDisModelOuts because KidneyDisModelIns does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_LICENSE ON LICENSE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on LICENSE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Contract  LICENSE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002772f", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_27", FK_COLUMNS="ContractNumber" */
    IF EXISTS (SELECT * FROM deleted,Contract
      WHERE
        /* %JoinFKPK(deleted,Contract," = "," AND") */
        deleted.ContractNumber = Contract.ContractNumber AND
        NOT EXISTS (
          SELECT * FROM LICENSE
          WHERE
            /* %JoinFKPK(LICENSE,Contract," = "," AND") */
            LICENSE.ContractNumber = Contract.ContractNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last LICENSE because Contract exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Associate  LICENSE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="AssocSSN" */
    IF EXISTS (SELECT * FROM deleted,Associate
      WHERE
        /* %JoinFKPK(deleted,Associate," = "," AND") */
        deleted.AssocSSN = Associate.AssocSSN AND
        NOT EXISTS (
          SELECT * FROM LICENSE
          WHERE
            /* %JoinFKPK(LICENSE,Associate," = "," AND") */
            LICENSE.AssocSSN = Associate.AssocSSN
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last LICENSE because Associate exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_LICENSE ON LICENSE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on LICENSE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAssocSSN integer,
           @insContractNumber integer,
           @insLicenseNumber integer,
           @insWritingNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Contract  LICENSE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b8a0", PARENT_OWNER="", PARENT_TABLE="Contract"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_27", FK_COLUMNS="ContractNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ContractNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Contract
        WHERE
          /* %JoinFKPK(inserted,Contract) */
          inserted.ContractNumber = Contract.ContractNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update LICENSE because Contract does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Associate  LICENSE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Associate"
    CHILD_OWNER="", CHILD_TABLE="LICENSE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="AssocSSN" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AssocSSN)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Associate
        WHERE
          /* %JoinFKPK(inserted,Associate) */
          inserted.AssocSSN = Associate.AssocSSN
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update LICENSE because Associate does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Models ON Models FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Models */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Models  DepressionDisModelOuts on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00024d7e", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
    IF EXISTS (
      SELECT * FROM deleted,DepressionDisModelOuts
      WHERE
        /*  %JoinFKPK(DepressionDisModelOuts,deleted," = "," AND") */
        DepressionDisModelOuts.ModelID = deleted.ModelID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Models because DepressionDisModelOuts exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Models  KidneyDisModelOuts on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
    IF EXISTS (
      SELECT * FROM deleted,KidneyDisModelOuts
      WHERE
        /*  %JoinFKPK(KidneyDisModelOuts,deleted," = "," AND") */
        KidneyDisModelOuts.ModelID = deleted.ModelID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Models because KidneyDisModelOuts exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Models ON Models FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Models */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insModelID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Models  DepressionDisModelOuts on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002707a", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="DepressionDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_DEPRESSION_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ModelID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,DepressionDisModelOuts
      WHERE
        /*  %JoinFKPK(DepressionDisModelOuts,deleted," = "," AND") */
        DepressionDisModelOuts.ModelID = deleted.ModelID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Models because DepressionDisModelOuts exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Models  KidneyDisModelOuts on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Models"
    CHILD_OWNER="", CHILD_TABLE="KidneyDisModelOuts"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="MODEL_KIDNEY_MODEL_OUTPUT", FK_COLUMNS="ModelID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ModelID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,KidneyDisModelOuts
      WHERE
        /*  %JoinFKPK(KidneyDisModelOuts,deleted," = "," AND") */
        KidneyDisModelOuts.ModelID = deleted.ModelID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Models because KidneyDisModelOuts exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Product ON Product FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Product */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Product  CONTRACT_P_PRODUCT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00013289", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_42", FK_COLUMNS="LineOfBusiness" */
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_P_PRODUCT
      WHERE
        /*  %JoinFKPK(CONTRACT_P_PRODUCT,deleted," = "," AND") */
        CONTRACT_P_PRODUCT.LineOfBusiness = deleted.LineOfBusiness
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Product because CONTRACT_P_PRODUCT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Product ON Product FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Product */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insLineOfBusiness integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Product  CONTRACT_P_PRODUCT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001451f", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CONTRACT_P_PRODUCT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_42", FK_COLUMNS="LineOfBusiness" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(LineOfBusiness)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CONTRACT_P_PRODUCT
      WHERE
        /*  %JoinFKPK(CONTRACT_P_PRODUCT,deleted," = "," AND") */
        CONTRACT_P_PRODUCT.LineOfBusiness = deleted.LineOfBusiness
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Product because CONTRACT_P_PRODUCT exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


