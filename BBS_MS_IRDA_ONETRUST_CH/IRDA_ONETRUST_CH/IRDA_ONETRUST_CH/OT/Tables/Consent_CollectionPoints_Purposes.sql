﻿CREATE TABLE [OT].[Consent_CollectionPoints_Purposes] (
    [IRDA_SYS_CREATED]           DATETIME         DEFAULT (getdate()) NOT NULL,
    [IRDA_SYS_UPDATED]           DATETIME         NULL,
    [IRDA_SYS_RUNDATETIME]       DATETIME         NULL,
    [IRDA_SYS_DELETED]           DATETIME         NULL,
    [IRDA_SYS_IS_DELETED]        BIT              NULL,
    [IRDA_SYS_CHANGED_BY]        NVARCHAR (128)   NULL,
    [IRDA_SYS_CORRELATION_ID]    UNIQUEIDENTIFIER NULL,
    [IRDA_SYS_COUNTRY]           NVARCHAR (3)     NULL,
    [IRDA_SYS_IS_DIRTY]          BIT              NULL,
    [IRDA_SYS_OBJECT_GUID]       UNIQUEIDENTIFIER DEFAULT (newsequentialid()) NULL,
    [IRDA_OA_SYS_UNIQUE_KEY]     NVARCHAR (255)   NOT NULL,
    [PurposeId]                  UNIQUEIDENTIFIER NULL,
    [PurposeLabel]               NVARCHAR (255)   NULL,
    [PurposeDescription]         NVARCHAR (500)   NULL,
    [PurposeStatus]              NVARCHAR (50)    NULL,
    [PurposeNewVersionAvailable] BIT              NULL,
    [PurposeType]                NVARCHAR (50)    NULL,
    [PurposeLifeSpan]            INT              NULL,
    [PurposeVersion]             INT              NULL,
    [PurposeExternalReference]   NVARCHAR (500)   NULL,
    [PurposeCreatedDate]         DATETIME         NULL,
    [PurposeUpdatedDate]         DATETIME         NULL,
    [PurposeCustomerPreferences] NVARCHAR (1000)  NULL,
    [CollectionPointId]          UNIQUEIDENTIFIER NULL,
    [CollectionPointVersion]     INT              NULL
);

