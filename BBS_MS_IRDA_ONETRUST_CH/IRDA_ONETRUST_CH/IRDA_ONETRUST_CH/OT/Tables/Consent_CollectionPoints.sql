﻿CREATE TABLE [OT].[Consent_CollectionPoints] (
    [IRDA_SYS_CREATED]               DATETIME         DEFAULT (getdate()) NOT NULL,
    [IRDA_SYS_UPDATED]               DATETIME         NULL,
    [IRDA_SYS_RUNDATETIME]           DATETIME         NULL,
    [IRDA_SYS_DELETED]               DATETIME         NULL,
    [IRDA_SYS_IS_DELETED]            BIT              NULL,
    [IRDA_SYS_CHANGED_BY]            NVARCHAR (128)   NULL,
    [IRDA_SYS_CORRELATION_ID]        UNIQUEIDENTIFIER NULL,
    [IRDA_SYS_COUNTRY]               NVARCHAR (3)     NULL,
    [IRDA_SYS_IS_DIRTY]              BIT              NULL,
    [IRDA_SYS_OBJECT_GUID]           UNIQUEIDENTIFIER DEFAULT (newsequentialid()) NULL,
    [IRDA_OA_SYS_UNIQUE_KEY]         NVARCHAR (255)   NOT NULL,
    [CollectionPointId]              UNIQUEIDENTIFIER NULL,
    [Version]                        INT              NULL,
    [Name]                           NVARCHAR (255)   NULL,
    [CollectionPointType]            NVARCHAR (50)    NULL,
    [ConsentType]                    NVARCHAR (50)    NULL,
    [Status]                         NVARCHAR (50)    NULL,
    [SubjectIdentifier]              NVARCHAR (500)   NULL,
    [CreateDate]                     DATETIME         NULL,
    [FirstReceiptOn]                 DATETIME         NULL,
    [ReceiptCount]                   INT              NULL,
    [Description]                    NVARCHAR (500)   NULL,
    [WebFormUrl]                     NVARCHAR (500)   NULL,
    [PrivacyPolicyUrl]               NVARCHAR (500)   NULL,
    [DataControllerName]             NVARCHAR (1000)  NULL,
    [RightToWithdraw]                NVARCHAR (1000)  NULL,
    [HowToWithdraw]                  NVARCHAR (1000)  NULL,
    [OtherInformation]               NVARCHAR (1000)  NULL,
    [ActivationDate]                 DATETIME         NULL,
    [OrganizationId]                 UNIQUEIDENTIFIER NULL,
    [DoubleOptIn]                    BIT              NULL,
    [RedirectUrl]                    NVARCHAR (1500)  NULL,
    [IABVendorId]                    INT              NULL,
    [NoConsentTransactions]          BIT              NULL,
    [LastSdkIntegrationDate]         DATETIME         NULL,
    [Language]                       NVARCHAR (50)    NULL,
    [Languages]                      NVARCHAR (4000)  NULL,
    [HostedSDK]                      BIT              NULL,
    [ShowWarning]                    BIT              NULL,
    [SendConsentEmail]               BIT              NULL,
    [PerferenceCenterId]             UNIQUEIDENTIFIER NULL,
    [PreferenceCenterName]           NVARCHAR (255)   NULL,
    [PreferenceCenterOrganizantName] NVARCHAR (500)   NULL,
    [ResponsibleUserId]              UNIQUEIDENTIFIER NULL,
    [DataElements]                   NVARCHAR (4000)  NULL,
    [CanCreateNewVersion]            BIT              NULL
);

