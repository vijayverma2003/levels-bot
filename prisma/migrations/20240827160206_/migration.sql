-- CreateTable
CREATE TABLE `Guild` (
    `guildId` VARCHAR(191) NOT NULL,
    `levelUpMessage` VARCHAR(191) NULL,
    `levelRoleMessage` VARCHAR(191) NULL,
    `levelUpChannelId` VARCHAR(191) NULL,

    PRIMARY KEY (`guildId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GuildUser` (
    `userId` VARCHAR(191) NOT NULL,
    `level` INTEGER NOT NULL DEFAULT 1,
    `experience` INTEGER NOT NULL DEFAULT 0,
    `guildId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`userId`, `guildId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LevelRole` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `guildId` VARCHAR(191) NOT NULL,
    `roleId` VARCHAR(191) NOT NULL,
    `level` INTEGER NOT NULL,

    UNIQUE INDEX `LevelRole_guildId_level_key`(`guildId`, `level`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TempRole` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `guildId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `roleId` VARCHAR(191) NOT NULL,
    `endsAt` BIGINT NOT NULL,

    UNIQUE INDEX `TempRole_userId_roleId_key`(`userId`, `roleId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `GuildUser` ADD CONSTRAINT `GuildUser_guildId_fkey` FOREIGN KEY (`guildId`) REFERENCES `Guild`(`guildId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LevelRole` ADD CONSTRAINT `LevelRole_guildId_fkey` FOREIGN KEY (`guildId`) REFERENCES `Guild`(`guildId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TempRole` ADD CONSTRAINT `TempRole_guildId_userId_fkey` FOREIGN KEY (`guildId`, `userId`) REFERENCES `GuildUser`(`guildId`, `userId`) ON DELETE RESTRICT ON UPDATE CASCADE;
