CREATE TABLE [OT].[Consent_CollectionPoints_Purposes_Topics_Staging] (
    [IRDA_SYS_CREATED]        DATETIME         DEFAULT (getdate()) NOT NULL,
    [IRDA_SYS_UPDATED]        DATETIME         NULL,
    [IRDA_SYS_RUNDATETIME]    DATETIME         NULL,
    [IRDA_SYS_DELETED]        DATETIME         NULL,
    [IRDA_SYS_IS_DELETED]     BIT              NULL,
    [IRDA_SYS_CHANGED_BY]     NVARCHAR (128)   NULL,
    [IRDA_SYS_CORRELATION_ID] UNIQUEIDENTIFIER NULL,
    [IRDA_SYS_COUNTRY]        NVARCHAR (3)     NULL,
    [IRDA_SYS_IS_DIRTY]       BIT              NULL,
    [IRDA_SYS_OBJECT_GUID]    UNIQUEIDENTIFIER DEFAULT (newsequentialid()) NULL,
    [IRDA_OA_SYS_UNIQUE_KEY]  NVARCHAR (255)   NOT NULL,
    [TopicId]                 UNIQUEIDENTIFIER NULL,
    [TopicName]               NVARCHAR (255)   NULL,
    [TopicIntegrationKey]     NVARCHAR (1000)  NULL,
    [TopicCanDelete]          BIT              NULL,
    [CollectionPointId]       UNIQUEIDENTIFIER NULL,
    [PurposeId]               UNIQUEIDENTIFIER NULL,
    [CollectionVersion]       INT              NULL,
    [PurposeVersion]          INT              NULL
);

