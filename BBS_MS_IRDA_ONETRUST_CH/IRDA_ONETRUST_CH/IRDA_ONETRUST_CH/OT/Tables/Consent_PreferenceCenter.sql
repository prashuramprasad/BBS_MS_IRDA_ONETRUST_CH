CREATE TABLE [OT].[Consent_PreferenceCenter] (
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
    [Id]                      NVARCHAR (100)   NULL,
    [Name]                    NVARCHAR (100)   NULL,
    [OrganizationName]        NVARCHAR (500)   NULL,
    [Template]                NVARCHAR (50)    NULL,
    [PublishedDate]           NVARCHAR (100)   NULL,
    [Status]                  NVARCHAR (20)    NULL,
    [CreatedDate]             NVARCHAR (100)   NULL
);

