function onUpdateDatabase()
	logger.info("Updating database to version 53 (increment level limit to uint64)")

	-- this one had no ON DELETE CASCADE, need to re-create it
	db.query([[
		ALTER TABLE `players`
        MODIFY COLUMN `level` BIGINT UNSIGNED NOT NULL;
	]])
end
