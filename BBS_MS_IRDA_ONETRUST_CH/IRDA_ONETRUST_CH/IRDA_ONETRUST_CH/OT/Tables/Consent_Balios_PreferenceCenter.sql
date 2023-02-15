CREATE TABLE [OT].[Consent_Balios_PreferenceCenter] (
    [IRDA_SYS_CREATED]        DATETIME         DEFAULT (getdate()) NOT NULL,
    [IRDA_SYS_UPDATED]        DATETIME         NULL,
    [IRDA_SYS_RUNDATETIME]    DATETIME         NULL,
    [IRDA_SYS_DELETED]        DATETIME         NULL,
    [IRDA_SYS_IS_DELETED]     BIT              NULL,
    [IRDA_SYS_CHANGED_BY]     NVARCHAR (128)   NULL,
    [IRDA_SYS_CORRELATION_ID] NVARCHAR (MAX)   NULL,
    [IRDA_SYS_COUNTRY]        NVARCHAR (3)     NULL,
    [IRDA_SYS_IS_DIRTY]       BIT              NULL,
    [IRDA_SYS_OBJECT_GUID]    UNIQUEIDENTIFIER DEFAULT (newsequentialid()) NULL,
    [IRDA_OA_SYS_UNIQUE_KEY]  NVARCHAR (255)   NOT NULL,
    [Purpose_ID]              NVARCHAR (100)   NULL,
    [Purpose_Name]            NVARCHAR (100)   NULL,
    [Purpose_Description]     NVARCHAR (500)   NULL,
    [Purpose_Status]          NVARCHAR (50)    NULL,
    [Purpose_Type]            NVARCHAR (50)    NULL,
    [Topic_ID]                NVARCHAR (100)   NULL,
    [Topic_Name]              NVARCHAR (100)   NULL
);

