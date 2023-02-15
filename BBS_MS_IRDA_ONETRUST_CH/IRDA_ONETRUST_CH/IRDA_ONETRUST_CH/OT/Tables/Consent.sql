﻿CREATE TABLE [OT].[Consent] (
    [IRDA_SYS_OBJECT_GUID]    UNIQUEIDENTIFIER DEFAULT (newsequentialid()) NULL,
    [IRDA_SYS_CREATED]        DATETIME         DEFAULT (getdate()) NOT NULL,
    [IRDA_SYS_UPDATED]        DATETIME         NULL,
    [IRDA_SYS_RUNDATETIME]    DATETIME         NULL,
    [IRDA_SYS_DELETED]        DATETIME         NULL,
    [IRDA_SYS_IS_DELETED]     BIT              NULL,
    [IRDA_SYS_CHANGED_BY]     NVARCHAR (128)   NULL,
    [IRDA_SYS_CORRELATION_ID] UNIQUEIDENTIFIER NULL,
    [IRDA_SYS_COUNTRY]        NVARCHAR (3)     NULL,
    [IRDA_SYS_IS_DIRTY]       BIT              NULL,
    [IRDA_OA_SYS_UNIQUE_KEY]  NVARCHAR (255)   NOT NULL,
    [identifier]              NVARCHAR (50)    NOT NULL,
    [countryCode]             NVARCHAR (2)     NOT NULL,
    [academicTitle]           NVARCHAR (50)    NULL,
    [salutation]              NVARCHAR (50)    NULL,
    [firstName]               NVARCHAR (50)    NULL,
    [lastName]                NVARCHAR (50)    NULL,
    [language]                NVARCHAR (2)     NULL,
    [audience]                NVARCHAR (50)    NULL,
    [salesRepresentativeId]   NVARCHAR (10)    NULL,
    [sourceSystem]            NVARCHAR (50)    NOT NULL,
    [legacyReferenceId]       NVARCHAR (50)    NULL,
    [consentedtype]           NVARCHAR (50)    NOT NULL,
    [purposetype]             NVARCHAR (100)   NOT NULL,
    [purposestate]            NVARCHAR (50)    NOT NULL,
    [channeltype]             NVARCHAR (50)    NULL,
    [channelstate]            NVARCHAR (50)    NULL,
    [collection]              DATETIME         NOT NULL,
    [lastUpdated]             DATETIME         NOT NULL,
    [expiry]                  DATETIME         NULL
);

