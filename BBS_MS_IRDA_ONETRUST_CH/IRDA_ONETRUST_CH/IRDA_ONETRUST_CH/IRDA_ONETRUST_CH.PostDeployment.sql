/*
Post-Deployment Script: IRDA_ODS_postdeployment.sql							
--------------------------------------------------------------------------------------
This post deployment script...
  - ... defines the permissions for IAM Securit Groups for the database based on some 
    parameters that need to be set in the db configuration as well as the TFS 
	environment. These Variables are:
		- DatabaseName  = The technical Name of the Database
		- target_stage  = Differes between D, Q and P, default Value is “D”, Q and 
						  P will be defined via tfs release config
		- DBType		= Can either be "IRDA" or "ODS" 
		- Division	 	= Can be "PH" for Pharmaceuticals, "CS" for CropScience, 
						  "CH" for ConsumerHealth or "XX" for Cross Divisional 
						  Databases. 
  - ... sets the release number as parameter to the database settings
--------------------------------------------------------------------------------------
*/

USE [$(DatabaseName)]
GO
IF '$(target_stage)' = 'D'
BEGIN
	IF '$(DBType)' = 'IRDA'
	BEGIN 
		IF '$(Division)' = 'PH' OR '$(Division)' = 'XX'
		BEGIN
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.dev') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.dev]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.dev]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.dev]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.dev') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.dev]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.dev]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.dev]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.dev') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.dev]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.dev]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.dev') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.dev]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.dev]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.dev]
		END
		IF '$(Division)' = 'CS' OR '$(Division)' = 'XX'
		BEGIN
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.dev') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.dev]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.dev]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.dev]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.dev') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.dev]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.dev]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.dev') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.dev]
			END	
			ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.dev]
		END 
		/*IF '$(Division)' = 'CH' /* OR '$(Division)' = 'XX' */
		BEGIN
			/* Consumer Health Groups to be added */
		END */
	END
	IF '$(DBType)' = 'ODS'
	BEGIN 
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.dev') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.dev]
		END
		ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.dev]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.dev') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.dev]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.dev]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.dev]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.dev') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.dev]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.dev]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.dev]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.dev') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.dev] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.dev]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.dev]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.dev]
	END 
END
GO

IF '$(target_stage)' = 'Q'
BEGIN
	IF '$(DBType)' = 'IRDA'
	BEGIN 
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.qa') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.qa]
		END
		ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.qa]
		IF '$(Division)' = 'PH' OR '$(Division)' = 'XX' 
		BEGIN
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.qa') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.qa]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.qa]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.qa]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.qa') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.qa]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.qa]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.qa]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.qa') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.qa]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.qa]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.qa') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.qa]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.qa]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.qa]
		END
		IF '$(Division)' = 'CS' OR '$(Division)' = 'XX'
		BEGIN
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.qa') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.qa]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.qa]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.access.qa]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.qa') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.qa]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.qa]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.qa') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.qa]
			END	
			ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.qa]
		END 
		/*IF '$(Division)' = 'CH' /* OR '$(Division)' = 'XX' */
		BEGIN
			/* Consumer Health Groups to be added */
		END */
	END
	IF '$(DBType)' = 'ODS'
	BEGIN 
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.qa') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.qa]
		END
		ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.qa]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.qa') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.qa]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.qa]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.qa]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.qa') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.qa]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.qa]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.qa]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.qa') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.qa] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.qa]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.qa]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.qa]
	END 
END
GO

IF '$(target_stage)' = 'P'
BEGIN
	IF '$(DBType)' = 'IRDA'
	BEGIN 
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.prod') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.prod]
		END
		ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.admin.prod]
		IF '$(Division)' = 'PH' OR '$(Division)' = 'XX'
		BEGIN
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.prod') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.prod]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.prod]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.developer.prod]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.prod') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.prod]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.prod]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.integration.prod]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.prod') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.prod]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.reader.prod]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.prod') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.prod]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.irda.support.prod]
		END
		IF '$(Division)' = 'CS' OR '$(Division)' = 'XX'
		BEGIN
			IF database_principal_id('AD-BAYER-CNB\bs.u.bbs.ms.cs.imcm.access.prod') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.u.bbs.ms.cs.imcm.access.prod] FOR LOGIN [AD-BAYER-CNB\bs.u.bbs.ms.cs.imcm.access.prod]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.u.bbs.ms.cs.imcm.access.prod]
			ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.u.bbs.ms.cs.imcm.access.prod]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.prod') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.prod]
			END	
			ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.readonly.prod]
			IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.prod') IS NULL
			BEGIN
				CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.prod]
			END	
			ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.cs.imcm.admin.prod]
		END 
		/*IF '$(Division)' = 'CH' /* OR '$(Division)' = 'XX' */
		BEGIN
			/* Consumer Health Groups to be added */
		END */
	END
	IF '$(DBType)' = 'ODS'
	BEGIN 
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.prod') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.prod]
		END
		ALTER ROLE [db_owner] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.admin.prod]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.prod') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.prod]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.developer.prod]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.prod') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.prod]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.prod]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.integration.prod]
		IF database_principal_id('AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.prod') IS NULL
		BEGIN
			CREATE USER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.prod] FOR LOGIN [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.prod]
		END	
		ALTER ROLE [db_datareader] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.prod]
		ALTER ROLE [db_datawriter] ADD MEMBER [AD-BAYER-CNB\bs.a.bbs.ms.imcm.ods.support.prod]
	END 
END
GO
USE [master]
GO
	EXEC [$(DatabaseName)].sys.sp_addextendedproperty @name=N'BuildNumber', @value=N'$(BuildNumber)' 
GO
